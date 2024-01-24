module ApplicationHelper
    def page_title(title = '')
        # 参考: https://osamudaira.com/194/
        base_title = 'PISS'
        title.empty? ? base_title : title + ' - ' + base_title	
    end
end
