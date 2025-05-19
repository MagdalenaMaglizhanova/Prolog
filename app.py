import streamlit as st
import janus_swi as janus

janus.consult("trains", """
train('Amsterdam', 'Haarlem').
train('Amsterdam', 'Schiphol').
""")

st.title("Prolog влакове")

query = st.text_input("Въведи Prolog заявка:", "train(_From,_To), Tuple=_From-_To")

if st.button("Изпълни"):
    try:
        results = [d['Tuple'] for d in janus.query(query)]
        st.write("Резултати:", results)
    except Exception as e:
        st.error(f"Грешка: {e}")
