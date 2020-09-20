# Meal Planning, by Hackers, for Hackers

## Inspiration
Eating is both a necessity, and something to be enthusiastic about. For some, time is scarce as their time is better spent elsewhere. For others, the ecological impact of their food consumption matters more. Everyone has a very different relationship to food, and we wanted to capture this by making an application that everybody could use to plan their meals more sustainably, and efficiently. 

## What it does
The key idea was to offer users the possibility to plan their meal for the week, and easily synchronize that with an integrated groceries list - saving our users countless hours of staring at an open fridge, wondering what they'll cook that night, before settling for ordering take-out. We think home cooking should be fun and stress-free!

## How we built it
We focused on developing the core ideas behind our mission statement. Therefore, we started by applying principles of user-centered design: defining typical customer profiles, and identifying what they would take out of the app. We estimated customer pain points, and used those to establish customer journeys, as well as determine what tasks should be accessible.

Saturday, after a good night's sleep, we started working on a mobile user interface in flutter, and strived to create the main screens that would define the app. In parallel, we started developing the back-end required to power our idea. We used a MongoDB database, in conjunction with a RESTful Flask server architecture. The Migros Recipe and Product APIs provide us with a great wealth of information. Luckily for us it is one of the most complete sources available! The recipe API provides us with all the information we need to be able to suggest meal plans to our users, while the information contained in the product API ensures their purchasing decisions stay aligned with their ethical and moral goals. Furthermore, we rely on the Eaternity API to compute the nutritional and ecological impacts of our recommendations.

## Challenges we ran into
Our main challenge was understanding how we could help solve a problem many people have become accustomed to.
We unfortunately underestimated the amount of time it would take to learn to use Flutter. We should have chosen a front-end framework that allowed fast and efficient design iteration.

## Accomplishments that we're proud of
We are proud of having thought in terms of problems and not solutions. We believe all problems can be solved, and we should focus our attention on the important ones.
We are proud of having established detailed customer journeys as well as developing a good understanding of their wishes and needs.
We are also very proud of taking the time to sleep on Saturday, even if the urge to start hacking made it very difficult.

## What I learned
Luigi learned UI/UX design in flutter, and Adobe XD, as well as some state management using futures. Samuel learned more about what goes into a back-end system, and got a glimpse of the full stack. David had the chance to work on the most complicated app he'd ever designed, as well as work with a RESTful API. Danil learned how to create a full tech stack and how to manage a NoSql database. Overall we all gained experience in Systems Architecture as well as User-centered design.

## What's next for Meal Hack
A clean and intuitive interface. a picture scanner, and a recommender system.
