################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'9',
                          "totalGeneratedCount"=>'15',
                          "totalReportCount"=>'6'
                         );

spyDecompileWaiverInfo("waive_cmd_id"=>'1',
                       "waiverCmd"=>'q%waive  -exact  -rule "STARC05-1.4.3.4" -comment "Created by ICer on 04-Oct-2026 04:00:23"%',
                       "-rule"=>'q%STARC05-1.4.3.4%',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:00:23"',
                       "violations_waived"=>'18 19',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'2',
                       "waiverCmd"=>'q%waive  -exact  -rule "W415a" -comment "Created by ICer on 04-Oct-2026 04:00:23"%',
                       "-rule"=>'"W415a"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:00:23"',
                       "violations_waived"=>'7 9',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'2'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'3',
                       "waiverCmd"=>'q%waive  -exact  -rule "W240" -comment "Created by ICer on 04-Oct-2026 04:00:23"%',
                       "-rule"=>'"W240"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:00:23"',
                       "violations_waived"=>'8 10',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'3'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'4',
                       "waiverCmd"=>'q%waive  -exact  -rule "W480" -comment "Created by ICer on 04-Oct-2026 04:00:23"%',
                       "-rule"=>'"W480"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:00:23"',
                       "violations_waived"=>'5',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'4'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'5',
                       "waiverCmd"=>'q%waive  -exact  -rule "W528" -comment "Created by ICer on 04-Oct-2026 04:00:23"%',
                       "-rule"=>'"W528"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:00:23"',
                       "violations_waived"=>'11 12',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'5'
                      );

spyWaiversDataCount("totalWaivers"=>'5',
"totalWaiversApplied"=>'5',
"totalWaiversWithRegExp"=>'0',
"totalWaiversWithRuleSpecified"=>'5',
"totalWaiversWithIpSpecified"=>'0',
"totalWaiversWithFileLine"=>'0',
                         );

spyProhibitWaiverRules(                         );

spySetWaivedViolationNumberHash("");

1;
