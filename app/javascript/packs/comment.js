import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


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
        `<div class="post_comment"><p>${comment.content}</p></div>`
      )
    })
  })

})