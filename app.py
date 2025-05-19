import janus_swi as janus
import streamlit as st

st.title("Prolog Demo от Python")

query = st.text_input("Въведи Prolog заявка:", "writeln('Здравей!')")

if st.button("Изпълни"):
    result = janus.query_once(query)
    st.write("Резултат:", result)
