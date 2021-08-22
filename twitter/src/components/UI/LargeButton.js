import React from "react";

import "./LargeButton.css";

const LargeButton = (props) => {
  return (
    <button className="largeTweetBtn" type={props.type || button}>
      {props.children}
    </button>
  );
};

export default LargeButton;
