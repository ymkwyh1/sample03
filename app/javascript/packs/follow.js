import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


const handleFollowStatus = (hasFollowed) => {
    if (hasFollowed){
       $('.unfollow').removeClass('hidden')
    } else {
       $('.follow').removeClass('hidden')
    }
}



document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#account-show').data()
  const accountId = dataset.accountId
  var followersCount = $('.followers_count').text()

  axios.get(`/accounts/${accountId}/follows`)
    .then((response) => {

        const hasFollowed = response.data.hasFollowed
        handleFollowStatus(hasFollowed)
        
    })


    $('.unfollow').on('click', () => {
      axios.post(`/accounts/${accountId}/unfollows`)
        .then((response) => {
          if (response.data.status === 'ok') {
              $('.unfollow').addClass('hidden')
              $('.follow').removeClass('hidden')
              followersCount -= 1
              $('.followers_count').text(followersCount)
          }
        })
        .catch((e) => {
          error()
        })
    })

    $('.follow').on('click', () => {
      axios.post(`/accounts/${accountId}/follows`)
        .then((response) => {
          if (response.data.status === 'ok') {
              $('.unfollow').removeClass('hidden')
              $('.follow').addClass('hidden')
              followersCount += 1
              $('.followers_count').text(followersCount)
          }
        })
        .catch((e) => {
          error()
        })
    })

})