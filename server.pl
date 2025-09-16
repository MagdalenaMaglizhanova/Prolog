// server.js
const express = require("express");
const cors = require("cors");
const { execFile } = require("child_process");
const path = require("path");
const fs = require("fs");

const app = express();
const port = process.env.PORT || 10000;

app.use(cors());
app.use(express.json());

// POST /prolog-run
// Приема { code: "...Prolog code...", query: "generate_art(Svg)" }
app.post("/prolog-run", (req, res) => {
  const { code, query } = req.body;

  if (!code || !query) {
    return res.status(400).json({ error: "No code or query provided" });
  }

  // Създаваме временен Prolog файл
  const tmpFile = path.join(__dirname, "temp.pl");
  fs.writeFileSync(tmpFile, code);

  // Подготвяме целта
  let goal = "";
  const hasVars = /[A-Z]/.test(query);
  if (hasVars) {
    const variableRegex = /[A-Z][a-zA-Z0-9_]*/g;
    const variables = query.match(variableRegex);
    const args = variables ? variables.join(",") : "";
    goal = `findall([${args}], ${query}, L), writeq(L), nl, halt.`;
  } else {
    goal = `${query}, write('true'), nl, halt.`;
  }

  // Изпълняваме SWI-Prolog
  execFile("swipl", ["-q", "-s", tmpFile, "-g", goal], (error, stdout, stderr) => {
    if (error) {
      console.error("Prolog Error:", error);
      console.error("Prolog Stderr:", stderr);
      res.status(500).json({ error: stderr || error.message });
    } else {
      res.json({ result: stdout.trim() || "false" });
    }
  });
});

app.listen(port, () => {
  console.log(`Prolog compiler server running on port ${port}`);
});
