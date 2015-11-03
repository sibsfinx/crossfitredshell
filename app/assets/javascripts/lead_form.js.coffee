window.LeadForm ||= {}

((app) ->
  $(document).ready ->
    $findFormBtn = $('@landing-teaser--find-form-btn')
    $formBlock = $('@landing-teaser--form-block')
    $formBlock.each ->
      $formBlock = $(@)
      $form = $formBlock.find('[role*="landing-teaser--form"]')
      $formEl = $formBlock.find('[role*="landing-teaser--form-element"]')
      $submitBtn = $formBlock.find('[role*="landing-teaser--form-submit-btn"]')
      $errorBlock = $formBlock.find('[role*="landing-teaser--form-error"]')
      $successBlock = $formBlock.find('[role*="landing-teaser--form-success"]')
      $findFormBtn.on 'click', (e) ->
        formTop = $formBlock.offset().top - $formBlock.height()/2
        $('body').animate({
          scrollTop: formTop
        }, 300)
      $formEl
        .on 'ajax:success', (e, data, status, xhr) ->
          handleSuccess $form, $successBlock, $errorBlock
        .on 'ajax:error', (e, xhr, status, error) ->
          handleError $form, $successBlock, $errorBlock

  handleError = ($form, $successBlock, $errorBlock) ->
    $successBlock.removeClass('animated fadeIn').addClass('animated fadeOut hide')
    $errorBlock.removeClass('animated fadeOut hide').addClass('animated fadeIn')
    #$form.addClass('animated fadeOut hide')

  handleSuccess = ($form, $successBlock, $errorBlock) ->
    $errorBlock.removeClass('animated fadeIn').addClass('animated fadeOut hide')
    $form.addClass('animated fadeOut hide')
    $successBlock.removeClass('animated fadeOut hide').addClass('animated fadeIn')

)(window.LeadForm ||= {})
