# frozen_string_literal: true

module ApplicationHelper
  FLASH_TO_CSS = {
    notice: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    success: 'alert-success'
  }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'github', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def nav_tests
    link_to t('common.tests'), tests_path
  end

  def flash_to_css(key)
    FLASH_TO_CSS.fetch(key.to_sym, key)
  end
end
