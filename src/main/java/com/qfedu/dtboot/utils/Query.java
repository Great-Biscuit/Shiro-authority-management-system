package com.qfedu.dtboot.utils;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 查询参数
 */
public class Query extends LinkedHashMap<String, Object> {
    private static final long serialVersionUID = 1L;

    public Query(Map<String, Object> params) {
        this.putAll(params);
        StringBuffer sb = new StringBuffer("%");
        String search;
        //搜索参数
        if (params.containsKey("search")) {
            search = params.get("search").toString().trim();
            if (search.length() != 0) {
                for (int i = 0; i < search.length(); i++) {
                    sb.append(search.charAt(i) + "%");
                }
            }
        }
        this.put("search", sb.toString());

        //分页参数
        Integer limit = Integer.parseInt(params.get("limit").toString());
        Integer offset = Integer.parseInt(params.get("offset").toString());
        this.put("limit", limit);
        this.put("offset", offset);

    }
}
