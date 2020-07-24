$(function(){
  function buildHTML(comment){
    let html = 
    `<div class="comments">
      <div class="comment-date">
        ${comment.created_at}
      </div>
      <div class="comment-nickname">
        ${comment.nickname}
      </div>
      <div class="comment-content">
        ${comment.text}
      </div>
    </div>`
    return html;
  }
  $('#new-comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comment-index').append(html);
      $('.comment-text').val('');
      $('.comment-btn-box').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});