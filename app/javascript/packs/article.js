import $ from 'jquery'
import axios from 'modules/axios'

import {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
} from 'modules/handle_heart'



const handleHeardDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}


document.addEventListener('DOMContentLoaded',  () => {
  const dataset = $('#article-show').data()
  const articleId = dataset.articleId

  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeardDisplay(hasLiked)
    })

    listenInactiveHeartEvent(articleId),
    listenActiveHeartEvent(articleId)
  
})