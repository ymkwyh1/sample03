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

const like = () => {
    $('.active-heart').removeClass('hidden')
    $('.inactive-heart').addClass('hidden')
}

const unlike = () => {
    $('.inactive-heart').removeClass('hidden')
    $('.active-heart').addClass('hidden')
}



document.addEventListener('turbolinks:load', () => {
  const dataset = $('#post-show').data()
  const postId = dataset.postId


  axios.get(`/posts/${postId}/like`)
    .then((response) => {
        const hasLiked = response.data.hasLiked
        handleHeartDisplay(hasLiked)
    })

    $('.inactive-heart').on('click', () => {
      axios.post(`/posts/${postId}/like`)
        .then((response) => {
          if (response.data.status === 'ok') {
            like()
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
            unlike()
          }
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })

})