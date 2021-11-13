# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'github', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def nav_tests
    link_to t('common.tests'), tests_path
  end
end
