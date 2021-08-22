import React from "react";

import "./FollowSuggestions.css";

const FollowSuggestions = () => {
  return (
    <div className="follow-suggestions">
      <div className="suggestions">
        <img src="./images/logo1.png" alt="" />
        <div className="suggestion-details">
          <h3>Rockstar Games</h3>
          <a target="_blank" href="https://twitter.com/RockstarGames">
            @RockstarGames
          </a>
        </div>
        <button>Follow</button>
      </div>
      <div className="suggestions">
        <img src="./images/logo2.png" alt="" />
        <div className="suggestion-details">
          <h3>RDR 2</h3>
          <a target="_blank" href="https://twitter.com/RDROnlineCom">
            @RDR2
          </a>
        </div>
        <button>Follow</button>
      </div>
      <div className="suggestions">
        <img src="./images/logo3.png" alt="" />
        <div className="suggestion-details">
          <h3>World of Warcraft</h3>
          <a target="_blank" href="https://twitter.com/Warcraft">
            @WOW
          </a>
        </div>
        <button>Follow</button>
      </div>
    </div>
  );
};

export default FollowSuggestions;
