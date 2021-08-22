import React, { useState, useEffect, useRef } from "react";
import Button from "../UI/Button";
import Extras from "../UI/Extras";

import "./Feed.css";

const TweetsFeed = () => {
  const [tweets, setTweets] = useState(null);
  const tweetRef = useRef();
  const SERVER_SIDE = "http://127.0.0.1:9292/";

  const fetchTweets = async () => {
    const response = await fetch(SERVER_SIDE, { method: "GET" });
    const json = await response.json();

    setTweets(json);
  };

  useEffect(() => fetchTweets(), []);

  return (
    <div className="feed">
      <div className="feed-header">
        <h3>Home</h3>
        <i className="far fa-star"></i>
      </div>
      <form
        className="new-tweet-form"
        action={`${SERVER_SIDE}/tweets`}
        method="post"
      >
        <div className="pp-input">
          <img src="./images/pp1.jpg" alt="" />
          <input
            type="text"
            id="tweet"
            name="tweet"
            placeholder="What's happening?"
            ref={tweetRef}
          />
        </div>
        <div className="extras-button">
          <Extras />
          <Button type="submit">Tweet</Button>
        </div>
      </form>
      <ul>
        {tweets &&
          tweets.data.map((tweet) => <li key={tweet.id}> {tweet.tweet}</li>)}
      </ul>
    </div>
  );
};

export default TweetsFeed;
