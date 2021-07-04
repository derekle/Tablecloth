module TablesHelper
    def current_table(id)
        if id != nil
            current_table = Table.find_by_id(id)
        end
    end

    def table_user(table)
        results = table.orders.where(ispaid:false).first
        if results != nil
            results = results.user
        end
        results
    end

    def edit_table(tableid)
        edit_table = Table.find_by_id(tableid)
        return edit_table
    end
end
