## Centralized Logger

Centralized logger is a place that aggregates logs from all the systems. The logger is on a different machine, as it makes it easier to scale as you add different services/servers.

Even if you have different development, staging and production environments, they all communicate to a centerl logger.

- Originally **Splunk** was the leader in the space.
- THen **ELK** stack came into place.
- In 2021, Elastic who maintained ELK stack, closed source ELK Stack. The license still allows you to host Elasticsearch on-premise for free, you just cannot create a SASS offering Elasticsearch.
- Then AWS launced OpenSearch, OpenSearch Dashboards.

ELK stack
- Elasticsearch - like a database that allows to quickly query data (full-text search and analysis engine)
- Logstash - put this on VPS and this will read the log files, parse and filter them and send to the centralized logger. (logstash is a memory hog, and people generally use Fluentd or beats or lighter alternatives instead)
- Kibana - UI for visualizing data from elasticsearch

## Building a Saas
- Hosting (sst, vercel, netlify, fly.io)
- Authentication (clerk, auth0, cognito)
- Logging (aws cloudwatch, datadog, axios fm). How long do API endpoints take to run.
- Database (postgres, dynamo, convex, mysql, mongo)
- Email (sendgrid, aws ses, mailgun). Send email to users
- SMS (awa sns, twilio)
- Events (aws websocket api, pusher). Live websocket events so UI's can update exactly when things finish
- File storage for uploading images (aws s3, uploadthing, cloudinary).
- Payment processing (stripe, paypal)
- Documentation (nextra, docsify, eraser, miro)
- Version control (git)
- CI/CD (github actions, circleci, travisci, gocd, jenkins)
- Issue tracking (jira, github issues, trello)
- Communication (slack, discord, zoom)
- Search (elastic search, aws opensearch)
- Marketing (sponsored videos, ads, affiliate links)
- ab testing (spitter.gg, launchdarkly)
- Feedback (canny, zendesk). For things like, a user cannot login and they want to get in touch.
- api keys (unkey). Like on twitter you can create api keys, unkey can be used for creating those keys
- Design - figma

## Large scale software development

Github

- main branch - the production code
- feature branch - this is where you code new features and keep doing till you are happy. Then a pull request is made to get the feature merged. Other members will review the pull request, for knowledge sharing (this is useful as people leave and the more people know the software the better).
    - When the change is merged with the main, that fires a CI/CD pipeline, where we build, test and deploy the code.

For enterprise software, directly pushing to the main is not feasible, as the code needs to be thoroughly tested.

- dev branch - instead of checking from the main branch, you check from dev branch and create feature branch. Then you open a pull request to merge features from feature branch to dev branch.
    - When a pull request is merged, it will trigeer a build, test, deploy action.
    - AWS is used for this with terraform. The github action spins a ton of services like lambda, opensearch, dynamo, cloudfront, api gateway.
    - Now developers can check deployment over here (with fake data).
- test (staging) branch - when everything seems good in dev branch, a pull request is made to test branch.
    - The pull request triggers another CI/CD pipeline, and that spins same environment on aws like dev brach.
    - The main difference being this would have pre-production data (more realistic).
    - You can also ask the users and testers to look at this and show them the features and get feedback.
    - You can also do load tests for SQL queries, smoke tests.
- main branch - After you are happy with the test branch, a pull request is made to the main branch.
    - The pull request again triggers a CI/CD action to create aws deployment, which is same as dev/test branch.
    - This is why terraform is so important, since you never have to worry about setting up the infrastrucutre and it also ensures sync between dev, staging and main branch.

The above is valid for one team. For multiple teams, each team would have a similar structure and as a result you would have multiple production deployment environments.

Also, all the production environments would be connected through stared microservices.

Another problem that needs to be solved is, when you push from dev branch to test then to main, you might push some unfinished code/features that should not run in production. To resolve this issue, you need to have feature flags and wrap the code with these flags. So the code only runs when these flags are turned on. Now the production enviornment would have a "feature database" to turn on/off features.

Uptime problem. Some projects have to have an uptime of all year except an hour and so on. To solve this, you create have multiple replicas of production environment, one on the east coast aws and another in west aws. So if the east goes down, all the users are redirected to the west coast. This is called active-passive setup.

Another setup is active-active. This is more focused on syncing the data between the west and east. And if a failure of a component occurs (meaning 1 component fails out of 10), then for this component you can use the west coast component. Some rules still need to be followed focusing on where the data live though.

How to handle bugs (maybe user tells you this)? The first thing you do is turn off the feature flag for the thing causing the bug. Second thing you can do rollback deployment. Or more often you have to do hotfix, where you check off a branch directly off the main (instead of doing dev -> staging -> main), do the quick fix and then push it to main or staging (depending on how risk averse you are). After all of this is done, you need to merge the new changes from main back to dev branch.

## How to develop software applications (trunk based development)

This is the undustry standard

- check off feature branch from main branch.
- Every day you try to merge as many pull requests as you can to main.
- The main benefit is you get rapid feedback. If you have two developers working on different features, then they both can know early in developmnt if their work is causing conflict with the other person. And as a result you can try to combine both of their work into a single feature to create stability.
- This has another benefit that pr's are generally small, and thus easier to review.
- The downside of this approach is when you have a bug. Now when each developer pulls from the main, the bugs gets propagated to each developer, and thus you can potentially break work for everyone.
- To counter the above, you have to write a lot of automated tests. Before you are allowed to push changes to main, the tests (unit and integration), prettier, linter tests will run, and only after all the tests are successful, you are allowed to merge.

When merging with the main branch, you just run some checks not the entire test suit.

When pull request is merged, a github action runs to get the new code deployed, in the production environment. (build, test, deploy). To go further, rather than triggering deployment on every pull request, you can trigger deployment when a new "tag release" is made.

Drawbacks

- Due to every pr getting merged quickly, you will have unfinished features in production.
- To resolve this issue, you use feature flags (using a database), or environment variables.
- Depending on how complex the feature is, checking a different 'feature branch' might be a better option.

You can also have a "pre-production" environment and the stakeholders can check for bugs. And then you push to production.

## How to achieve zero downtime on new deploys

(Blue green deployment)

Let's say users are interacting with "server v1" running in a vm. Now if you want to deploy a new version, then you ssh into the vm, kill the server, and get the new version of the software running.

In blue-green deployment, you have the original vm (blue) running "v1" of the software. Now you create a second vm (green) when you want to deploy v2 of the code. In the new vm, you deploy the new code and start the server "v2".

To get the users which are interacting with the "v1" using apis, to move to "v2", you use a load balancer.

The user's hit the load balancer, and then load balancer interacts with the vms. For the new requests, the load balancer would switch them to "v2", and for the users that were still interacting with "v1", the load balancer would wait for their request to finish and then redirect them to new version.

Another benefit is, if you keep the old server running and their are bugs with "v2", then you can just redirect users back to "v1". (of course you need to be wary of database migrations. If the databse schema changes, then rolling back to previous version would be tricky).

Canary deployment. Instead of redirecting all the users to "v2", you redirect like 5% of the users to "v2". You have automation setup, to check for erros on "v2" and if there are no errors, more users would be moved to "v2", otherwise users keep using "v1".

