module.exports = app => {
  // Your code here
  app.log("Yay, the app was loaded!");

  app.on("issues.opened", async context => {
    const issueComment = context.issue({
      body: "Thanks for opening this issue!"
    });
    return context.github.issues.createComment(issueComment);
  });

  app.on("create.branch", async context => {
    app.log(context);
  });

  app.on("pull_request.opened", async context => {
    app.log(context);
  });

  // For more information on building apps:
  // https://probot.github.io/docs/

  // To get your app running against GitHub, see:
  // https://probot.github.io/docs/development/
};
