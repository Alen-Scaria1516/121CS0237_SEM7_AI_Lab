from random import choice

class SimpleVacuumEnvironment:
  def __init__(self, rooms):
    '''initially everything is dirty'''
    self.rooms = [{ 'name': room, 'dirty': True } for room in rooms] 
    self.agent_position = choice([0,1])
  
  def is_room_dirty(self):
    """Checks if the current room is dirty."""
    current_room = self.rooms[self.agent_position]
    return current_room['dirty']

  def clean_room(self):
    """ Cleans the current room where the agent is located."""
    current_room = self.rooms[self.agent_position]
    
    if not (current_room['dirty']):
      print(f"{self.rooms[self.agent_position]['name']} is already clean")
      print("Moving to next room \n")
      self.agent_position = (self.agent_position + 1)%2
      self.clean_room()
      return
    
    current_room['dirty'] = False
    print(f" {self.rooms[self.agent_position]['name']} Cleaned! ")

  def move_agent(self, room_name):
    """ Moves the agent to the specified room. """
    for i, room in enumerate(self.rooms):
        if room['name'] == room_name:
            self.agent_position = i
            print(f'Agent moved to {room_name}.')
            return
    raise ValueError(f"Room '{room_name}' not found.")

  def display_environment(self):
    """ Displays the current state of the environment."""
    print(f"Agent is in room '{self.rooms[self.agent_position]['name']}'\n")
    for room in self.rooms:
        status = 'Dirty' if room['dirty'] else 'Clean'
        print(f"Room '{room['name']}': {status}")

class SimpleReflexVacuumAgent:
  def __init__(self, environment, state):
    """ Initializes the agent with a given environment."""
    self.environment = environment
    self.state =  [{ 'name': room, 'dirty': True } for room in state]

  def check_room(self):
    print(f"Currrent Room is {self.environment.rooms[self.environment.agent_position]['name']}. ")
    print(f'Is the room dirty? {self.environment.is_room_dirty()}')
    return

  def display_actions(self):
    print("The available actions are : ")
    print("1. Clean the current room")
    print("2. Move to a desired room")
    return

  def run_action(self, action):
    if(action == 1):
      curr_room = self.environment.rooms[self.environment.agent_position]
      if not self.state[curr_room]['dirty']:
        print(f"Room {curr_room['name']} is already cleaned by Agent!")
        return
      self.environment.clean_room()
      
      self.state[curr_room]['dirty'] = False
    elif(action == 2):
      print("Specify the room you want to move to :")
      room_name = input().strip()
      self.environment.move_agent(room_name)
    else: 
      print("Not a valid action!")
    
def main():
  print("Welcome to Simple Vaccum Cleaer (Model Based Reflex Agent)!!\n")

  
  rooms = ['Room A', 'Room B']
  print(f"Rooms are :{rooms}\n")

  
  env = SimpleVacuumEnvironment(rooms=rooms)
  print('\n')
  
  agent = SimpleReflexVacuumAgent(environment=env, state=rooms)


  while True:
      print("Displaying the environment: ")
      env.display_environment()
      # agent.check_room()
      print('\n')
      agent.display_actions()

      try:
          action = int(input("Choose an action (1 or 2): ").strip())
          agent.run_action(action)
      except ValueError:
          print("Invalid input. Please enter a valid action!")

      # Ask if the user wants to continue
      continue_simulation = input("Do you want to continue (yes/no)? \n").strip().lower()
      if continue_simulation != 'yes':
          print("Exiting the simulation.")
          break

if __name__ == "__main__":
  main()
