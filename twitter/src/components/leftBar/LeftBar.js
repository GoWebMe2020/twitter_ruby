import React from "react";
import LargeButton from "../UI/LargeButton";
import "./LeftBar.css";

const LeftBar = () => {
  return (
    <div className="leftbar">
      <i className="fab fa-twitter"></i>
      <div className="leftBarIcon">
        <i className="fas fa-home"></i> <p>Home</p>
      </div>
      <div className="leftBarIcon">
        <i className="fas fa-hashtag"></i> <p>Explore</p>
      </div>
      <div className="leftBarIcon">
        <i className="far fa-bell"></i>
        <p>Notifications</p>
      </div>
      <div className="leftBarIcon">
        <i className="far fa-envelope"></i>
        <p>Messages</p>
      </div>
      <div className="leftBarIcon">
        <i className="far fa-bookmark"></i>
        <p>Bookmarks</p>
      </div>
      <div className="leftBarIcon">
        <i className="far fa-list-alt"></i>
        <p>List</p>
      </div>
      <div className="leftBarIcon">
        <i className="far fa-user"></i>
        <p>Profile</p>
      </div>
      <div className="leftBarIcon">
        <i className="fas fa-bars"></i>
        <p>More</p>
      </div>
      <LargeButton type="submit">Tweet</LargeButton>
    </div>
  );
};

export default LeftBar;
