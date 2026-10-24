################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'6',
                          "totalGeneratedCount"=>'65',
                          "totalReportCount"=>'59'
                         );

spyDecompileWaiverInfo("waive_cmd_id"=>'1',
                       "waiverCmd"=>'q%waive  -rule "Ac_cdc01a" -comment "Created by ICer on 07-Oct-2026 02:38:47"%',
                       "-rule"=>'"Ac_cdc01a"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 02:38:47"',
                       "violations_waived"=>'152',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1_04Oct26_04.04/cdc/cdc_verify/spyglass-1_04Oct26_04.04_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'2',
                       "waiverCmd"=>'q%waive  -rule "Ac_datahold01a" -comment "Created by ICer on 07-Oct-2026 02:38:47"%',
                       "-rule"=>'"Ac_datahold01a"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 02:38:47"',
                       "violations_waived"=>'153 154',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1_04Oct26_04.04/cdc/cdc_verify/spyglass-1_04Oct26_04.04_waiver_file.awl"',
                       "waiverline"=>'2'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'3',
                       "waiverCmd"=>'q%waive  -rule "Ac_conv02" -comment "Created by ICer on 07-Oct-2026 02:38:47"%',
                       "-rule"=>'"Ac_conv02"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 02:38:47"',
                       "violations_waived"=>'146 148',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1_04Oct26_04.04/cdc/cdc_verify/spyglass-1_04Oct26_04.04_waiver_file.awl"',
                       "waiverline"=>'3'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'4',
                       "waiverCmd"=>'q%waive  -rule "Ac_conv01" -comment "Created by ICer on 07-Oct-2026 02:38:47"%',
                       "-rule"=>'"Ac_conv01"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 02:38:47"',
                       "violations_waived"=>'151',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1_04Oct26_04.04/cdc/cdc_verify/spyglass-1_04Oct26_04.04_waiver_file.awl"',
                       "waiverline"=>'4'
                      );

spyWaiversDataCount("totalWaivers"=>'4',
"totalWaiversApplied"=>'4',
"totalWaiversWithRegExp"=>'0',
"totalWaiversWithRuleSpecified"=>'4',
"totalWaiversWithIpSpecified"=>'0',
"totalWaiversWithFileLine"=>'0',
                         );

spyProhibitWaiverRules(                         );

spySetWaivedViolationNumberHash("");

1;
