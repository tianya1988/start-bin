#!/bin/sh

curl -XPUT localhost:9200/_template/scsc-alarm-http-template -d '{"order":0,"template":"*scsc-alarm-http*","settings":{"index":{"codec":"best_compression","refresh_interval":"30s","number_of_shards":"1","number_of_replicas":"0"}},"mappings":{"aliases":{},"blockip":{"properties":{"log_type":{"type":"keyword"},"h_srcip":{"type":"keyword"},"h_srcipv6":{"type":"keyword"},"h_dstip":{"type":"keyword"},"h_dstipv6":{"type":"keyword"},"h_cookie":{"type":"keyword"},"alarm_metricInfo":{"properties":{"h_srcip_geoInfo":{"properties":{"city":{"type":"keyword"},"country":{"type":"keyword"},"lat":{"type":"keyword"},"lon":{"type":"keyword"}}},"h_dstip_geoInfo":{"properties":{"city":{"type":"keyword"},"country":{"type":"keyword"},"lat":{"type":"keyword"},"lon":{"type":"keyword"}}},"h_srcip_geoInfo_score":{"type":"integer"},"h_dstip_geoInfo_score":{"type":"integer"},"alarm_result_score":{"type":"integer"},"h_dstip_assetInfo":{"type":"keyword"},"h_domain_blackType":{"type":"keyword"},"h_srcip_blackType":{"type":"keyword"},"h_dstip_blackType":{"type":"keyword"},"h_dstip_blackType_score":{"type":"integer"},"h_srcip_blackType_score":{"type":"integer"},"h_domain_blackType_score":{"type":"integer"},"alarm_result_level":{"type":"keyword"},"alarm_result_type":{"type":"keyword"},"ruleid":{"type":"integer"},"alarm_result_time":{"type":"date"}}}}},"http":{"properties":{"log_type":{"type":"keyword"},"h_srcip":{"type":"keyword"},"h_srcipv6":{"type":"keyword"},"h_dstip":{"type":"keyword"},"h_dstipv6":{"type":"keyword"},"h_cookie":{"type":"keyword"},"alarm_metricInfo":{"properties":{"h_srcip_geoInfo":{"properties":{"city":{"type":"keyword"},"country":{"type":"keyword"},"lat":{"type":"keyword"},"lon":{"type":"keyword"}}},"h_dstip_geoInfo":{"properties":{"city":{"type":"keyword"},"country":{"type":"keyword"},"lat":{"type":"keyword"},"lon":{"type":"keyword"}}},"h_srcip_geoInfo_score":{"type":"integer"},"h_dstip_geoInfo_score":{"type":"integer"},"alarm_result_score":{"type":"integer"},"h_dstip_assetInfo":{"type":"keyword"},"h_domain_blackType":{"type":"keyword"},"h_srcip_blackType":{"type":"keyword"},"h_dstip_blackType":{"type":"keyword"},"h_dstip_blackType_score":{"type":"integer"},"h_srcip_blackType_score":{"type":"integer"},"h_domain_blackType_score":{"type":"integer"},"alarm_result_level":{"type":"keyword"},"alarm_result_type":{"type":"keyword"},"ruleid":{"type":"integer"},"alarm_result_time":{"type":"date"}}}}}},"aliases":{}}'
curl -XPUT localhost:9200/_template/scsc-http-template -d '{"order":0,"template":"scsc-http*","settings":{"index":{"codec":"best_compression","refresh_interval":"30s","number_of_shards":"1","number_of_replicas":"0"}},"mappings":{"aliases":{},"http":{"properties":{"alarm_metricInfo":{"properties":{"match_rules":{"type":"nested","properties":{"rule_type":{"type":"keyword"},"rule_level":{"type":"keyword"},"rule_name":{"type":"keyword"},"rule_context":{"type":"keyword"},"rule_score":{"type":"integer"},"rule_source":{"type":"keyword"}}},"h_srcip_geoInfo":{"properties":{"city":{"type":"keyword"},"country":{"type":"keyword"},"lat":{"type":"float"},"lon":{"type":"float"}}},"h_dstip_geoInfo":{"properties":{"city":{"type":"keyword"},"country":{"type":"keyword"},"lat":{"type":"float"},"lon":{"type":"float"}}},"h_srcip_geoInfo_score":{"type":"integer"},"h_dstip_geoInfo_score":{"type":"integer"},"alarm_result_score":{"type":"integer"},"h_domain_blackType":{"type":"keyword"},"h_srcip_blackType":{"type":"keyword"},"h_dstip_blackType":{"type":"keyword"},"h_dstip_blackType_score":{"type":"integer"},"h_srcip_blackType_score":{"type":"integer"},"h_domain_blackType_score":{"type":"integer"},"alarm_result_level":{"type":"keyword"}}},"refIp":{"index":"not_analyzed","type":"ip"},"ruleid":{"type":"integer"},"rule_okFlag":{"type":"boolean"}}},"_default_":{"dynamic_templates":[{"date":{"mapping":{"type":"date"},"match":".*time","match_pattern":"regex"}},{"ipv4":{"mapping":{"type":"keyword"},"match":".*ip","match_pattern":"regex"}},{"port":{"mapping":{"type":"integer"},"match":".*port","match_pattern":"regex"}},{"geo_point":{"mapping":{"type":"geo_point"},"match":".*_location","match_pattern":"regex"}},{"h_path":{"mapping":{"type":"text"},"match":".*h_path","match_pattern":"regex"}},{"h_query":{"mapping":{"type":"text"},"match":".*h_query","match_pattern":"regex"}},{"other":{"mapping":{"index":"not_analyzed","omit_norms":true,"type":"keyword"},"match":"*","match_mapping_type":"string"}}],"_all":{"enabled":false}}},"aliases":{}}'
curl -XPUT localhost:9200/_template/scsc-alarm-log-template -d '{"order":0,"template":"*scsc-alarm-log*","settings":{"index":{"codec":"best_compression","refresh_interval":"30s","number_of_shards":"1","number_of_replicas":"0"}},"mappings":{"aliases":{},"_default_":{"dynamic_templates":[{"date":{"mapping":{"type":"date"},"match":".*recv_time","match_pattern":"regex"}},{"port":{"mapping":{"type":"integer"},"match":".*port","match_pattern":"regex"}},{"other":{"mapping":{"index":"not_analyzed","omit_norms":true,"type":"keyword"},"match":"*","match_mapping_type":"string"}}],"_all":{"enabled":false}}},"aliases":{}}'
curl -XPUT localhost:9200/_template/scsc-log-template -d '{"order":0,"template":"*scsc-log*","settings":{"index":{"codec":"best_compression","refresh_interval":"30s","number_of_shards":"1","number_of_replicas":"0"}},"mappings":{"aliases":{},"_default_":{"dynamic_templates":[{"date":{"mapping":{"type":"date"},"match":".*recv_time","match_pattern":"regex"}},{"port":{"mapping":{"type":"integer"},"match":".*port","match_pattern":"regex"}},{"other":{"mapping":{"index":"not_analyzed","omit_norms":true,"type":"keyword"},"match":"*","match_mapping_type":"string"}}],"_all":{"enabled":false}}},"aliases":{}}'