# Save The Princess Challenge from HackerRank
To plug my solution into HackerRank, please copy and paste the contents of the hacker_rank_runner file. Cheers!

### Table of Contents
- [How To Install Locally](#how-to-install-locally)
- [Tools Used](#tools-used)
- [Thought Process](#thought-process)

---
## How To Install Locally
For usage on your local machine run the following commands into your terminal:

```
git clone git@github.com:isabellevillasenor/bot_saves_princess.git
cd bot_saves_princess
bundle install
bundle exec rspec
```

---
## Tools Used

- I used the [RSpec Gem](https://rspec.info/) to execute testing.
- I used the [SimpleCov Gem](https://github.com/simplecov-ruby/simplecov) to ensure 100% Lines Of Code were tested.
- I used the [Pry Gem](https://github.com/pry/pry) to simulate a developer console.

---
## Thought Process
Upon reading I broke the problem into three primary components needed in order to complete the task.
- [Grid](#grid)
- [Bot Movement](#bot-movement)
- [Path to Princess](#path-to-princess)

---
### File Structure
I chose to abstract each component into their own class, contained within the lib folder, as a means to follow SRP and encapsulation. The same structure goes for the spec folder, as well as GitWorkflow. PR's will be sent based off completion per functionality, as well as completion of proper edge case testing. I will compile all the code and required files into the `hacker_rank_runner` file, in order to allow for direct copy/pasting my solution into the HackerRank Interface. 

---
### Grid
The bot will always be placed in the middle of the grid, so grid needs to have a way to ensure that only *odd numbers* are accepted. The grid can never be less than 3x3 in order to properly complete task. 
#### Initialize Method
- `Array.new()` will need to be called in the initialize so that the array containing the grid will be saved with the Grid object upon instantiation. 
- Error Handling will also live in the initialize as opposed to the `create_grid` method in order to prevent initializing a Grid object with null values.
#### Create Grid Method
- For each index that's passed into the block, change the element to '-' and times that by the grid_size that's being passed in to ensure it's a square output. (NxN)

#### Place Bot Method
- To find the center of a square, if you have two coordinates (i.e. a = x/y & b = x/y) you would take the arguments of both corners, put them over two, add each x and each y and then divide by two and that will give you the coordinates of the center. However, since we're just getting passed the argument of the desired grid size, we can divide that number by two, twice, and use the output as the index that will be where `m` should be placed.

#### Place Princess Method
- Working with a 3x3 grid for example, given our current structure of the grid, we know it will look similar to this `["123", "456", "789"]`. From here we know that `[0][0]` will equal `1`, aka the top left corner. The remaining corners in this set up are 
- `[0][-1] = 3 (top right)` 
- `[-1][0] = 7 (bottom left)`
- `[-1][-1] = 9 (bottom right)`
No matter the combination of `[0]` and `[-1]` the princess will get put into a corner, so we can store `[0]` and `[-1]` and call `.sample` when we place the princess, as any combination will get us the desired outcome. 

#### Princess Coordinates
- We will need to have to the princesses coordinates in order to calculate the correct pathing from the bot to the princess. The easiest way to do this is to iterate through an array that holds the 4 placement possibilities, and compare them to the grid. If the corner contains 'p' then return that corner. Since `.flat_map` will just flatten the entire array into one, `.map` would be the most optimal, however it'll still give us `nil` values for where the criteria isn't met. 
- It makes sense to store this method in the grid class, as it's not bot functionality. We could make an additional Princess class, however, I don't believe this method/completion of the task requires the need for one.

---
### Bot Movement
- Following similar thought process to `place_princess` method, we know we can move around inside of our grid by using `-/+`. We also know we're going to need to store the information on where the bot has been placed dependent on the size of the grid, so we know where we're starting. We also need to know where the princess is located so we know where to go. We can assume: 
- If the princess is located on a `lower number x axis`, we should move `up` 
- If she's located on a `higher number x axis` we should move `down` 
- Similarly, if she's located on a `lower number y axis` we should move to the `left`
- And if it's a `higher numbered y axis` we should move to the `right`
First I'll need to build out the Bot class to get the coordinates of where the bot is, as well as store the movement functionality. Next, create an if statement that compares the x/y values in order to execute movement
However, if you think about a 3x3 grid, the bot will be located at [1.5, 1.5], which will always be higher than both 0 and -1. 

---
### Path to Princess
Now that the bot is able to tell if it needs to go up/down/left/right, we can make a `path_to_princess` method that calls on both the `vertical_movement` and `horizontal_movement`, and shovels the outputs into a blank array until bot placement == princess placement. To better follow SRP I will make use of a SavePrincess Class that inherits from the Bot class.
- I relocated the bot movement methods from the Bot Class to the Save Princess Class for better flow with the path_to_princess method