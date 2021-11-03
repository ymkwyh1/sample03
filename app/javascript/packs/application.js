
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()




const handleHeartDisplay = (hasLiked) => {
  if (hasLiked){
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}

document.addEventListener('turbolinks:load', () => {
  const dataset = $('#post-show').data()
  const postId = dataset.postId

  $('.show-comment-form').on('click', () => {
     $('.show-comment-form').addClass('hidden')
      $('.comment-form').removeClass('hidden')
  })

  $('.comment_addBtn').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力して下さい')
    } else {
      axios.post(`/posts/${postId}/comments`, {
        comment: {content: content}
      })
      .then((res) => {
        const comment = res.data
        $('.comment-container').append(
        `<div class="post_comment"><p>${comment.content}</p></div>`
      )
        $('#comment_content').val('')
      })
    }
  })


  axios.get(`/posts/${postId}`)
  .then((response) => {
    const comments = response.data
    comments.forEach((comment) => {
      $('.comment-container').append(
        `<div class="post_comment">
        <p>${comment.content}</p>
        </div>`
      )
    })
  })

  axios.get(`/posts/${postId}/like`)
    .then((response) => {
        const hasLiked = response.data.hasLiked
        handleHeartDisplay(hasLiked)
    })

    $('.inactive-heart').on('click', () => {
      axios.post(`/posts/${postId}/like`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $('.active-heart').removeClass('hidden')
            $('.inactive-heart').addClass('hidden')
          }
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })

    $('.active-heart').on('click', () => {
      axios.delete(`/posts/${postId}/like`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $('.inactive-heart').removeClass('hidden')
            $('.active-heart').addClass('hidden')
          }
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })

})