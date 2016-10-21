require 'spec_helper'
describe 'fetchcrl', type: 'class' do
  context 'with defaults for all parameters' do
    let(:facts) do
      { osfamily: 'RedHat',
        operatingsystemmajrelease: '6' }
    end
    it { should contain_class('fetchcrl') }
    it { should contain_class('fetchcrl::install') }
    it { should contain_class('fetchcrl::config') }
    it { should contain_class('fetchcrl::service') }
    it { should contain_package('fetch-crl') }
    it { should contain_file('/etc/fetch-crl.conf').without_content(%r{cache_control_request}) }
  end
  context 'with all parameters set' do
    let(:facts) do
      { osfamily: 'RedHat',
        operatingsystemmajrelease: '6' }
    end
    let(:params) { { cache_control_request: '1234' } }
    it { should contain_file('/etc/fetch-crl.conf').with_content(%r{^cache_control_request = 1234$}) }
  end
end
