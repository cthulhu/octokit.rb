# frozen_string_literal: true

describe Octokit::Client::DependabotAlerts do
  before do
    Octokit.reset!
    @client = oauth_client
  end
  context 'with a repo' do
    before(:each) do
      @repo = @client.create_repository('repo-alerts')
    end

    after(:each) do
      @client.delete_repository(@repo.full_name) unless @repo.nil?
    rescue Octokit::NotFound
    end

    describe '.get_dependabot_alerts', :vcr do
      it 'get repo specific dependabot alerts' do
        box = create_box(@client.get_dependabot_alerts(@repo.id))
        expect(box[:key_id]).not_to be_empty
      end
    end # .get_public_key
  end

end
