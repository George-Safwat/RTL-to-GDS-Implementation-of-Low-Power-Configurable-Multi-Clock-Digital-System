################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'18',
                          "totalGeneratedCount"=>'27',
                          "totalReportCount"=>'9'
                         );

spyComputeViolCountForTurbo("totalGeneratedCount"=>'25',
                          "totalGeneratedSecCount"=>'2',
                          "totalWaivedPrimaryMsgCount"=>'16',
                          "totalWaivedSecMsgCount"=>'2',
                         );

spyDecompileWaiverInfo("waive_cmd_id"=>'1',
                       "waiverCmd"=>'q%waive  -exact  -rule "ReportIgnoredOverlappingRules" -comment "Created by ICer on 04-Oct-2026 04:01:39"%',
                       "-rule"=>'"ReportIgnoredOverlappingRules"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:01:39"',
                       "violations_waived"=>'1 2 3 4 5 6 7 8',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_turbo_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'2',
                       "waiverCmd"=>'q%waive  -exact  -rule "STARC05-1.4.3.4" -comment "Created by ICer on 04-Oct-2026 04:01:39"%',
                       "-rule"=>'q%STARC05-1.4.3.4%',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:01:39"',
                       "violations_waived"=>'26 27 28',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_turbo_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'2'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'3',
                       "waiverCmd"=>'q%waive  -exact  -rule "W240" -comment "Created by ICer on 04-Oct-2026 04:01:39"%',
                       "-rule"=>'"W240"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:01:39"',
                       "violations_waived"=>'16 18',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_turbo_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'3'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'4',
                       "waiverCmd"=>'q%waive  -exact  -rule "W415a" -comment "Created by ICer on 04-Oct-2026 04:01:39"%',
                       "-rule"=>'"W415a"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:01:39"',
                       "violations_waived"=>'15 17',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_turbo_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'4'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'5',
                       "waiverCmd"=>'q%waive  -exact  -rule "W480" -comment "Created by ICer on 04-Oct-2026 04:01:39"%',
                       "-rule"=>'"W480"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:01:39"',
                       "violations_waived"=>'13',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_turbo_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'5'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'6',
                       "waiverCmd"=>'q%waive  -exact  -rule "W528" -comment "Created by ICer on 04-Oct-2026 04:01:39"%',
                       "-rule"=>'"W528"',
                       "-exact"=>'1',
                       "-comment"=>'"Created by ICer on 04-Oct-2026 04:01:39"',
                       "violations_waived"=>'19 20',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_turbo_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'6'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'7',
                       "waiverCmd"=>'q%waive  -parent  -du "ClkDiv" -rule "STARC05-1.4.3.4" -msg "Clock signal \'SYS_TOP.U0_ClkDiv.div_clk\' used  as a non-clock (Used with name \'SYS_TOP.U0_ClkDiv.div_clk\'). For similar 2 cases, please refer to the spreadsheet for details" -comment "parent_waived_as_child_get_waived"%',
                       "-du"=>'"ClkDiv"',
                       "-rule"=>'q%STARC05-1.4.3.4%',
                       "-msg"=>'q%Clock signal \'SYS_TOP.U0_ClkDiv.div_clk\' used as a non-clock (Used with name \'SYS_TOP.U0_ClkDiv.div_clk\'). For similar 2 cases, please refer to the spreadsheet for details%',
                       "-comment"=>'"parent_waived_as_child_get_waived"',
                       "violations_waived"=>'',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_turbo_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'7'
                      );

spyWaiversDataCount("totalWaivers"=>'7',
"totalWaiversApplied"=>'7',
"totalWaiversWithRegExp"=>'0',
"totalWaiversWithRuleSpecified"=>'7',
"totalWaiversWithIpSpecified"=>'0',
"totalWaiversWithFileLine"=>'0',
                         );

spyProhibitWaiverRules(                         );

spySetWaivedViolationNumberHash("");

1;
