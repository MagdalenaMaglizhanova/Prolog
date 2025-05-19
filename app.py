import streamlit as st

try:
    import janus_swi as janus
    prolog_available = True
except ImportError:
    prolog_available = False

st.title("🧠 Prolog + Streamlit")

if not prolog_available:
    st.error("❌ janus_swi не е инсталиран или не се поддържа в тази среда.")
    st.write("Инсталирай го с: `pip install janus_swi` и увери се, че SWI-Prolog е наличен.")
else:
    user_query = st.text_input("Въведи Prolog команда:", value="writeln('Hello from Prolog!')")

    if st.button("Изпълни"):
        try:
            result = janus.query_once(user_query)
            st.success("✅ Успешно изпълнение!")
            st.json(result)
        except Exception as e:
            st.error(f"⚠️ Грешка: {e}")
