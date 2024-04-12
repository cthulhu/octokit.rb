# frozen_string_literal: true

describe Octokit::Client::DependabotAlerts do
  before do
    Octokit.reset!
    @client = oauth_client
  end

  describe '.get_dependabot_alerts', :vcr do
    it 'lists all dependabot alerts' do
      alerts = @client.get_dependabot_alerts('octokit/octokit.rb')
      expect(alerts).to be_kind_of Array
      assert_requested :get, github_url("/repos/octokit/octokit.rb/dependabot/alerts")
    end
    it 'lists all dependabot alerts with state option' do
      alerts = @client.get_dependabot_alerts('octokit/octokit.rb', state: 'open')
      expect(alerts).to be_kind_of Array
      assert_requested :get, github_url("/repos/octokit/octokit.rb/dependabot/alerts?state=open")
    end
  end # .get_dependabot_alerts
end
