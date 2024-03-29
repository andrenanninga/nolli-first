import React, { useState, useEffect } from "react";
import logo from "./logo.svg";
import "./App.css";

const App = () => {
  const [date, setDate] = useState("unknown");

  useEffect(() => {
    fetch(`${process.env.REACT_APP_API_ENDPOINT}/date`)
      .then(response => response.text())
      .then(setDate);
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          {date}
        </a>
      </header>
    </div>
  );
};

export default App;
