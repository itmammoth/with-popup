WithPopup
====

WithPopup makes it easy to open and manage a popup window in your rails application, and which is NOT controlled by popup blocker.

## Demo

<img alt=”Demo" src=”https://raw.githubusercontent.com/itmammoth/with-popup/master/demo.gif” />

## Requirement

* rails ~> 4.0
* jquery-rails ~> 3.0

## Installation

Add this in your ```Gemfile```, and run the ```bundle install``` command.

```ruby
gem 'with-popup'
```

## Usage

WithPopup provides some helper methods managing a popup window in view and controller contexts, which are wrapping form helper methods that create clickable DOM (like ```link_to```, ```submit_tag```) with ```*_with_popup``` naming.

Typical usage is like this.

```HTML+ERB
# In your erb file
<%= form_for @post do |f| %>
  ...
  # Submit while opening a popup window
  <%= f.submit_with_popup %>
<% end %>
```

```Ruby
# In your controller
def create
  @post = Post.new(params[:post].permit(...))
  if @post.save
    # Show print preview in the popup window you've opened
    reload_popup print_post_path(@post)
    redirect_to @post
  else
    # Close the popup window
    close_popup
    render :new
  end
end
```

#### Note:
These ```*_with_popup``` methods nerver interrupt the original click actions, just open popup windows simultaneously.

## Form helper methods

All helper methods are defined to deledate the processing to the original methods they are wrapping, so you can invoke them as you do with the original methods.

#### FormTagHelper (ActionView::Base)

| Methods                           | Wrapped method         |
|-----------------------------------|------------------------|
| submit_with_popup_tag             | submit_tag             |
| image_submit_with_popup_tag       | image_submit_tag       |
| button_with_popup_tag             | button_tag             |
| button_with_popup_to              | button_to              |
| link_with_popup_to                | link_to                |
| link_with_popup_to_if             | link_to_if             |
| link_with_popup_to_unless         | link_to_unless         |
| link_with_popup_to_unless_current | link_to_unless_current |

#### FormHelper (ActionView::Helpers::FormBuilder)

| Methods           | Wrapped method |
|-------------------|----------------|
| submit_with_popup | submit         |
| button_with_popup | button         |

### Option

You can give a particular option for the javascript ```window.open``` function.

```HTML+ERB
# In your erb file
<%= submit_with_popup_tag 'Create and Print',
      with_popup: { src: '/loading', features: 'width=300,height=200' } %>
```

Its popup window will be opened like this

```Javascript
window.open('', '/loading', 'width=300,height=200');
```


## Controller methods

| Methods            | Description                                             |
|--------------------|---------------------------------------------------------|
| realod_popup(path) | Reload the popup window you opened with indicated path. |
| close_popup        | Close the popup window you opened.                      |


## Contribution
* Fork the master branch, and clone it.
* Run the ```bundle install``` command to start developing.
* Test it with the ```bundle exec rspec``` command.
* Shoot a pull-request, thank you.

## Licence

MIT

## Author

[itmammoth](https://github.com/itmammoth)
