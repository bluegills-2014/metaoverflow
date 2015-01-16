$('document').ready(function() {
  function voteResponseHandler(response) {
    console.log(response)
    $('#' + response.id).toggleClass('upvoted')
    $('#' + response.id + '-vote-count').html(response.count)
  }

  $('body').on('click', '.vote-arrow', function(e) {
    e.preventDefault()
    var questionId = this.id
    console.log($(this).attr("class"))
    if ($(this).attr("class") == 'vote-arrow upvoted') {
      var url = '/questions/' + questionId + '/downvote'
    } else {
      var url = '/questions/' + questionId + '/upvote'
    }
    var request = $.ajax({
      url: url,
      method: "post",
      dataType: "json",
      success: voteResponseHandler
    })
  })
})
