// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:before-stream-render', function(event) {
  if(document.getElementById(event.target.target).classList.contains('comment-wrapper')){
    event.preventDefault()

    let oldElement = document.getElementById(event.target.target)
  
    if(event.target.action === 'remove'){
      oldElement.classList.add('comment-out')
    }
  
    oldElement.addEventListener('animationend', function() {
      oldElement.replaceWith('')
    })
  }
  else if(event.target.firstElementChild instanceof HTMLTemplateElement){
    scrollToCommentAndCommentIn(event)
  }
})

async function scrollToCommentAndCommentIn(event){
  document.getElementsByClassName('post-btns')[0].scrollIntoView({block: 'start'})
  event.target.templateElement.content.firstElementChild.classList.add('comment-in')
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

//post-wrapper