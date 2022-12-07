# CSC343_Informal-Relational-Design
Designing an app schema back-end database for the concert ticket business in the relational model.

The domain
Suppose a new company is trying to break into the concert ticket business and you are designing the database back-end for their app. Below is the information that they want to be able to store for their first proof-of-concept version of the database. There is much more to be added later, such as credit card information, but this is not your responsibility.

• Concerts are booked into venues. A venue has a name (not unique), city, and street address.
• Every venue also has an owner, which could be a person or an organization or company. For now we are just storing the owner name as a string, and a single phone number associated with the owner. No two owners have the same phone number.
• Some people/organizations own multiple venues but all venues have a single owner.
• Every venue has at least 10 seats and there is no upper limit. Each seat has an identifier, such as “B37” (but
it could be any string).
• Seats in a venue are organized into sections. This is the same organization for every concert in that venue. Every seat belongs to exactly one section. Each section has a name, such as “floor level 1” that is unique to that venue, but another venue might use the same section name.
• Seat names do not repeat within the same section in a venue. But two different sections may have seats with the same name.
• Every concert has a name, such as “Mariah Carey - Merry Christmas to all example”, a date and time, and is in exactly one venue. All seats in the venue are available for every concert, i.e., we won’t account for venues that have different configurations where some seats are closed off for an event.
• Concert names are not unique (for instance, it may be on for several nights). But a venue can only have one concert at a given time. (We won’t worry about concert durations or end times.)
• Some seats are accessible to people with mobility issues
• The price of a ticket depends the concert and the section in which the seat is located in the venue.
• Users of the app have a unique username, and that’s all we’ll store about them for now. A user can purchase one or more tickets to any concert. When we record this, we also record the date and time of purchase.

Define a schema
Your first task is to construct a relational schema for our domain, expressed in DDL. Write your schema in a file called schema.ddl.
As you know, there are many possible schemas that satisfy the description above. We aren’t following a formal design process for Part 1, so instead follow as many of these general principles as you can when choosing among options:
1. Avoid redundancy.
2. Avoid designing your schema in such a way that there are attributes that can be null.
3. If a constraint given above in the domain description can be expressed without assertions or triggers, it should be enforced by your schema, unless you can articulate a good reason not to do so.
4. There may be additional constraints that make sense but were not specified in the domain description. You get to decide on whether to enforce any of these in your DDL.

-------------------------

Instance and queries
Once you have defined your schema, create a file called data.sql that inserts data into your database. the data that is described informally in file ticket-data.txt.
You may find it instructive to consider this data as you are working on the design. Then, write queries to do the following:
1. For each concert, report the total value of all tickets sold and the percentage of the venue that was sold. 2. For each owner, report how many venues they own.
3. For each venue, report the percentage of seats that are accessible.
4. Report the username of the person who has purchased the most tickets. If there is a tie, report them all.

Write your queries in files called q1.sql through q4.sql.
