import React, { useState, useEffect } from "react";
import FollowSuggestions from "./followSuggestions/FollowSuggestions";
import NewsFeed from "./newsFeed/NewsFeed";

import "./RightBar.css";

const RightBar = () => {
  return (
    <div className="rightbar">
      <div className="searchBar">
        <input type="text" placeholder="Search Twitter" />
      </div>
      <div className="rightBarFeedCard">{/* <NewsFeed /> */}</div>
      <FollowSuggestions />
    </div>
  );
};

export default RightBar;
