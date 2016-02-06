module Pdql
  # ダム諸量一覧
  # http://example.com/nrpc0702gDisp.do?timeAxis=60&areaCode=NN
  class Dam
    attr_reader :name, :admin_type, :uri, :area_cd

    def initialize(tr, area_cd = nil)
      @area_cd      = area_cd
      @name         = tr.search('td[1]').text.strip    # ダム名
      @admin_type   = tr.search('td[2]').text.strip    # 管理区分
      @history_link = tr.search('td/a').first

      return unless history_link?
      @uri = URI.parse(@history_link[:href])
      @observatory_sign_cd = observatory_sign_cd
    end

    def observatory_sign_cd
      return nil if uri.nil?
      @observatory_sign_cd ||= uri.query.split('&').first.gsub(/ID=/, '')
    end

    def history_link?
      !@history_link.nil?
    end
  end
end
