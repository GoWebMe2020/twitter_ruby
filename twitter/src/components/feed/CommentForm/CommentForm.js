import React from "react";

import commentFormStyles from "./CommentForm.module.css";

const CommentForm = (props) => {
  return (
    <form
      className={`${commentFormStyles.commentForm} ${props.className}`}
      action={`${props.SERVER_SIDE}/tweets/${props.tweet_id}/comments`}
      method="POST"
    >
      <input type="text" name="comment" placeholder="Comment here" required />
      <button type="submit">
        <i className="far fa-comment"></i>
      </button>
    </form>
  );
};

export default CommentForm;
