################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'3',
                          "totalGeneratedCount"=>'59',
                          "totalReportCount"=>'56'
                         );

spyDecompileWaiverInfo("waive_cmd_id"=>'1',
                       "waiverCmd"=>'q%waive  -rule "Ac_conv01" -comment "Created by ICer on 07-Oct-2026 02:38:29"%',
                       "-rule"=>'"Ac_conv01"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 02:38:29"',
                       "violations_waived"=>'85',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1_04Oct26_04.04/cdc/cdc_verify_struct/spyglass-1_04Oct26_04.04_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'2',
                       "waiverCmd"=>'q%waive  -rule "Ac_conv02" -comment "Created by ICer on 07-Oct-2026 02:38:29"%',
                       "-rule"=>'"Ac_conv02"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 02:38:29"',
                       "violations_waived"=>'80 82',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1_04Oct26_04.04/cdc/cdc_verify_struct/spyglass-1_04Oct26_04.04_waiver_file.awl"',
                       "waiverline"=>'2'
                      );

spyWaiversDataCount("totalWaivers"=>'2',
"totalWaiversApplied"=>'2',
"totalWaiversWithRegExp"=>'0',
"totalWaiversWithRuleSpecified"=>'2',
"totalWaiversWithIpSpecified"=>'0',
"totalWaiversWithFileLine"=>'0',
                         );

spyProhibitWaiverRules(                         );

spySetWaivedViolationNumberHash("");

1;
