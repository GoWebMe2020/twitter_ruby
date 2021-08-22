import "./App.css";
import React from "react";
import TweetsFeed from "./components/feed/Feed";
import LeftBar from "./components/leftBar/LeftBar";
import RightBar from "./components/rightBar/RightBar";

const App = () => {
  return (
    <div className="app">
      <LeftBar />
      <TweetsFeed />
      <RightBar />
    </div>
  );
};

export default App;
