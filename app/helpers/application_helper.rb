module ApplicationHelper
    def active_url(url)
        return 'bg-gray-700' if request.path == url
        ''
    end
end
