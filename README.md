# SitterSwap
Misha LeClair

### Objective

SitterSwap connects families with babysitters through referrals from friends. Families create a profile that lists & links to sitters who also have accounts. Families can check out each other’s list of sitters when they need help with child care.

![alt text](http://i.imgur.com/jqORQpV.png)

* Live Link: https://sitter-swap.herokuapp.com/
* GitHub: https://github.com/sfnewzgirl/sitter-swap-2
* Trello (user stories): https://trello.com/b/Q6C300j1/project-3-sitterswap

### Tech Stack
* HTML, SASS, Ruby on Rails
* Heroku

### Installation

SitterSwap is a web-based app and requires no installation steps.

### Challenges

The biggest challenge of this project were the model relationships. I had Person (or user if you will), Family and FamilyPeople. A person has many ```family_people``` relationships and many ```families``` but completing the circle of the relationships became the biggest hurdle.

![alt text](http://i.imgur.com/mi2G5Ng.jpg?1)

For example, linking on person to another person through the attribute ```:role``` in the join table ```family_people```.

In the ```family_people``` controller to create a sitter relationship:

```
def sitter_create
  @family_person = FamilyPerson.new(family_person_sitter_create_params)
  fams = FamilyPerson.select{ |fp| fp.role == "caregivers" && fp.person_id == current_person.id }

  if fams
    @family_person.family_id = fams[0].family_id
  end
  cur_fams = FamilyPerson.select{ |fp| fp.role == @family_person.role && fp.person_id == @family_person.person_id && fp.family_id == @family_person.family_id }

  if @family_person.save
    flash[:notice] = "Your sitter has been confirmed."
    flash[:color] = "success"
    redirect_to '/people/' + current_person.id.to_s
  else
    flash[:error] = "Something went wrong. Please try again."
    flash[:color] = "failure"
    redirect_to family_people_search
  end
end
```
Then to see a person's list of sitters on the page:

```
Person.joins(:family_people).where('family_people.family_id': @person_family_id).where('family_people.role': "sitters").each do |person| %>
  <li><strong>Sitter: </strong><%= link_to person.first_name, '/people/' + person.id.to_s %></li>
  ```

## Wireframes

![alt text]()

## What's Next
In it's current iteration, SitterSwap is only the beginning.
* Family profiles need to be expanded to really let those families shine. For example, letting families upload photos and craft descriptions about their families.
* Streamline the set up process. Right now the connections between people and families are made separately. The next step would be to streamline this in more cohesive forms and sign ups.
* SitterSwap is geared toward parents right now. The next step would be to integrate a solid sitter-based user flow where sitters can log on and see their families in a custom view.
* Direct messaging or emailing. SitterSwap should be a one stop shop! When people log in and connect, they should also be able to directly email or message each other.
