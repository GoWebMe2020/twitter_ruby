import React, { useState, useEffect, useRef } from "react";
import Button from "../../UI/Button";
import Extras from "../../UI/Extras";

const TweetForm = (props) => {
  const tweetRef = useRef();
  return (
    <form
      className="new-tweet-form"
      action={`${props.SERVER_SIDE}/tweets`}
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
  );
};

export default TweetForm;
