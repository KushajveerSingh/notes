**Laws of UX: Using Psychology to Design Better Products & Services** by *Jon Yablonski* (1st edition)

##  Jakob's Law

Users spend most of their time on other sites, and they prefer your site to work the same way as all the other sites they already know.

- Users will transfer expectations they have built around one familiar product to another that appears similar.
- By leveraging existing mental models, we can create superior user experiences in which the users can focus on their tasks rather than on learning new models.
- When making changes, minimize discord by empowering users to continue using a familiar version for a limited time.

When making drastic design changes to an app, make the changes gradual and provide users the option to revert back to the original. This is what Youtube did when migrating to Material UI, by asking users to opt in the new design and also providing an option to revert back to original.

## Fitts's Law

The time to acquire a target is a function of the distance to and size
of the target.

• Touch targets should be large enough for users to accurately select them.
• Touch targets should have ample spacing between them.
• Touch targets should be placed in areas of an interface that allow them to be easily acquired.

## Hicks's Law

The time it takes to make a decision increases with the number and complexity of choices available.

- Minimize choices when response times are critical to increase decision time.
- Break complex tasks into smaller steps in order to decrease cognitive load.
- Avoid overwhelming users by highlighting recommended options.
- Use progressive onboarding to minimize cognitive load for new users.
- Be careful not to simplify to the point of abstraction.

## Miller's Law

The average person can keep only 7 (+/- 2) items in their working memory.

- Don't use the "magical number seven" to justify unnecessary design limitations i.e. do not use the number seven to justify only using upto seven items in the navbar (this is bad because the navbar is always visible, so there is not point in limiting the options).
- Organize content into smaller chunks to helper users process, understand, and memorize easily (like phone numbers are chunked into groups).
- Remember that short-term memory capacity will vary per individual, based on their prior knowledge and situational context.

## Postel's Law

Be conservative in what you do (our design should be reliable and accessible), be liberal in what you accept from others (accept input from users via any input mechanism and different formats).

- Be empathetic to, flexible about, and tolerant to any of the various actions the user could take or any input they might provide.
- Anticipate virtually anything in terms of input, access, and capability while providing a reliable and accessible interface.
- The more we can anticipate and plan for in design, the more resilient the design will be.
- Accept variable input from users, translating that input to meet your requirements, defining boundaries for input, and providing clear feedback for the user.

## Peak-End Rule

People judge an experience largely based on how they felt at its peak and at its end, rather than on the total sum or average of every moment of the experience.

- Pay close attention to the most intense points and the final moments (the "end") of the user journey.
- Identify the moments when your product is most helpful, valuable, or entertaining and design to delight the end user.
- Remember that people recall negative experiences more vividly than positive ones.

Example of this is Mailchimp. Before sending an email, a popup is shown with "You are about to send a campaign to ... This is your moment of glory.". This is important because this moment of sending an email is a peak emotional moment that represents the accumulation of all the work that has gone into that email campaign, compounded by the potential fear of failure. The popup uses illustration, subtle animation, humor to defuse a potentially stressful moment.

The peak emotions also happen for negative experiences, like waiting in line. Example of this is Uber, which handles this by focusing on three concepts related to wait time

- Idleness aversion - customers are presented with animation that helps to keep them not only informed but also entertained.
- Operational transparency - app provides estimated time of travel and information on how arrival times are calculated.
- Goal gradient effect - each step of the process is clearly explained so that customers feel they are continuously making progress towards their goal of getting a ride.

Journey maps can be used to identify positive/negative peaks

1. Lens - based on the target audience. What scenario they are in and what are their expectations. Example

    Jane (persona) is using a ride-share service app to order a side (scenario) that she expects to arrive at her exact location in 10 minutes or less (expectation).

2. Experience
     - Identify all the phases that the user will go through when using your app.
     - Next, identify the actions that must be takes in each phase.
     - Next, for each phase try to identify the emotional state of the user, like their general thoughts, pain points, questions, or motivations.
     - From this you can draw a curve to represent the emotional state of the user. The peaks represent the emotional peaks of the customer.

3. Insights - For each experience, list the possible opportunities to improve the overall experience and the metrics associated with improving the experience.

    Providing real-time information on the location of the vehicle after the ride is ordered can help reduce the pain point of waiting (opportunity). That feature will need to be designed and developed by the product team (internal ownership) and can be monitored according to post-ride ratings (metric).

## Aesthetic-Usability Effect

Users often perceive aesthetically pleasing design as design that's more usable.

- An aesthetically pleasing design created a positive response in people's brains and leads them to believe the design actually works better.
- People are more tolerant to minor usability issues when the design of a product or service is aesthetically pleasing.
- Visually pleasing design can mask usability problems and prevent issues from being discovered during usability testing.

## von Restorff Effect

When multiple similar objects are present, the one that differs from the rest is most likely to be remembered.

- Make important information or key actions visually distinctive.
- Use restraint when placing emphasis on visual elements to avoid them competing with one another and to ensure salient items don't get mistakenly identified as ads.
- Don't exclude those with a color vision deficiency or low vision by relying exclusively on color to communicate contrast.
- Carefully consider users with motion sensitivity when using motion to communicate contrast.

## Tesler's Law

Tesler's law, also known as the law of conservation of complexity, states that for any system there is a certain amount of complexity that cannot be reduced.

- All processes have a core of complexity that cannot be designed away and therefore must be assumed by either the system or the user.
- Ensure as much as possible of the burden is lifted from users by dealing with inherent complexity during design and development.
- Take care not to simplify interfaces to the point of abstraction.

When sending an email, you must know the 'from' and 'to' email address. This is the complexity that cannot be get rid of.

But, you can help the users through design

- Populate the 'from' automatically as the email client probably knows this info.
- When typing 'to' give suggestions based on past emails.

## Doherty Threshold

Productivity increases when a computer and its users interact at a pace (<400 ms) that ensures that neither has to wait on the other.

- Provide system feedback within 400 ms in order to keep users' attention and increase productivity.
- Use perceived performance to improve response time and reduce the perception of waiting.
- Animation is one way to visually engage people while loading or processing is happening in the background.
- Progress bars help make wait times tolerable, regardless of their accuracy.
- Purposefully adding a delay to a process can actually increase its perceived value and instill a sense of trust, even when the process itself takes much less time.

For slow loading content, provide a skeleton screen when the content is loading.

For images, blur technique can be used. It works by first loading an extremely small version of an image and scaling (gaussian blur) it up to the target size. Once the larger version of the image is loaded in the background, it is placed behind the low-resolution version and revealed by fading out the top image.

Why fast response times might also be a problem

- A change that happens too fast may be completely missed, this is especially true when the change is not the result of an action taken by the user but something that happens automatically.
- When response it too fast, it can be difficult for the user to comprehend what happened.
- It can also result in mistrust if it dosen't align with the user's expectations about the task being performed.

Facebook security scan does this, by showing additional information to educate people about what is being scanned, and also adding a delay to instill trust that the scan is thorough.
