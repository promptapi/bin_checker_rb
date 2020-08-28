require "test_helper"

class BinCheckerRbTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::BinCheckerRb::VERSION
  end

  def test_environment_variable
    buffer_token = nil
    if ENV['PROMPTAPI_TOKEN']
      buffer_token = ENV['PROMPTAPI_TOKEN']
      ENV.delete('PROMPTAPI_TOKEN')
    end

    bin_information = BinCheckerRb.check('foo')

    refute_nil bin_information.fetch(:error)
    assert_equal bin_information[:error], "You need to set PROMPTAPI_TOKEN environment variable"

    ENV['PROMPTAPI_TOKEN'] = buffer_token if buffer_token
  end

  # def test_connection_err
  #   buffer_url = nil
  #   if ENV['PROMPTAPI_TEST_ENDPOINT']
  #     buffer_url = ENV['PROMPTAPI_TEST_ENDPOINT']
  #     ENV['PROMPTAPI_TEST_ENDPOINT'] = "http://no-url-exists.com/"
  #   end
  #
  #   bin_information = BinCheckerRb.check('foo')
  #
  #   refute_nil bin_information.fetch(:error)
  #   assert_equal bin_information[:error], "Connection error"
  #   ENV['PROMPTAPI_TEST_ENDPOINT'] = buffer_url if buffer_url
  # end

  # def test_json_parse_error
  #   bin_information = BinCheckerRb.check('foo')
  #   refute_nil bin_information.fetch(:error)
  #   assert_equal bin_information[:error], "JSON decoding error"
  # end

  # def test_client_error
  #   bin_information = BinCheckerRb.check('foo')
  #   refute_nil bin_information.fetch(:error)
  #   assert_equal bin_information[:error], "The server responded with status 404"
  # end
end
