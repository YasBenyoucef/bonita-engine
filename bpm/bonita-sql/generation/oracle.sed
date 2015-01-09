s/IMAGE/BLOB/g
s/BIGINT/NUMBER(19, 0)/g
s/INTEGER/NUMBER(10, 0)/g
s/LONGVARCHAR/VARCHAR2(1024 CHAR)/g
s/VARCHAR(\(.*\))/VARCHAR2(\1 CHAR)/g
s/TEXT/VARCHAR2(1024 CHAR)/g
s/TINYINT/SMALLINT/g
s/LONGVARBINARY/BLOB/g
s/\(\s*\)\(.*\)\sBOOLEAN\(.*NULL\)*\(\s\)*/\1\2 NUMBER(1)\3\4/g
s/MEDIUMBLOB/BLOB/g
s/LONGBLOB/BLOB/g
s/CLOB2/VARCHAR2(1024 CHAR)/g
s/FALSE/0/g
s/ IF EXISTS//g
s/previousVersion VARCHAR2(50) NOT NULL,/previousVersion VARCHAR2(50 CHAR),/g
s/DROP TABLE \(.*\);/DROP TABLE \1 cascade constraints purge;/g

#unnessessary keys
/fk_business_log_tenantId/d
/fk_businesslog_p_tenantId/d
/fk_data_instance_tenantId/d
/fk_data_mapping_tenantId/d
/fk_datasource_tenantId/d
/fk_dependency_tenantId/d
/fk_dependencymapping_tenantId/d
/fk_document_content_tenantId/d
/fk_document_mapping_tenantId/d
/fk_job_desc_tenantId/d
/fk_job_param_tenantId/d
/fk_processsupervisor_tenantId/d
/fk_profile_tenantId/d
/fk_profileentry_tenantId/d
/fk_profilemember_tenantId/d

/ALTER TABLE datasourceparameter ADD CONSTRAINT fk_datasrcparam_tenantId FOREIGN KEY (tenantid) REFERENCES tenant(id);/d
/ALTER TABLE arch_process_comment ADD CONSTRAINT fk_Aproc_com_tenantId FOREIGN KEY (tenantid) REFERENCES tenant(id);/d
/ALTER TABLE arch_data_instance ADD CONSTRAINT fk_Adata_inst_tenantId FOREIGN KEY (tenantid) REFERENCES tenant(id);/d
/ALTER TABLE arch_data_mapping ADD CONSTRAINT fk_Adata_map_tenantId FOREIGN KEY (tenantid) REFERENCES tenant(id);/d
s/fk_event_trigger_instance_flownode_instanceId_idx/fk_evtTrig_fln_Id_idx/g
s/fk_process_definition_categoryId_idx/fk_procDef_catId_idx/g
s/fk_arch_flownode_instance_actorId_idx/fk_Afln_actId_idx/g
s/fk_data_mapping_data_instanceId_idx/fk_dataMap_dataInstId_idx/g
s/fk_datasourceparameter_tenantId_idx/fk_DSParam_tenId_idx/g
s/fk_dependencymapping_tenantId_idx/fk_depMap_tenId_idx/g
s/fk_document_content_tenantId_idx/fk_docCont_tenId_idx/g
s/fk_external_identity_mapping_user_Id_idx/fk_extIdMap_userId_idx/g
s/fk_external_identity_mapping_roleId_idx/fk_extIdMap_roleId_idx/g
s/fk_external_identity_mapping_group_Id_idx/fk_ext_idMap_grpId_idx/g
s/fk_external_identity_mapping_tenantId_idx/fk_extIdMap_tenId_idx/g
s/fk_user_membership_group_Id_idx/fk_usrMember_grpId_idx/g
s/fk_user_membership_tenantId_idx/fk_usrMember_tenaId_idx/g
s/fk_arch_document_mapping_arch_process_instanceId_idx/fk_ADocMap_AProc_idx/g
s/fk_arch_document_mapping_tenantId_idx/fk_ADocMap_tenId_idx/g
s/fk_document_mapping_process_instanceId_idx/fk_docMapProcId_idx/g
s/fk_document_mapping_tenantId_idx/fk_docMap_tenId_idx/g
s/fk_process_definition_tenantId_idx/fk_procDef_tenId_idx/g
s/fk_process_comment_process_instanceId_idx/fk_procCom_ProcId_idx/g
s/fk_process_comment_tenantId_idx/fk_procCom_tenId_idx/g
s/fk_process_instance_tenantId_idx/fk_procInst_tenId_idx/g
s/fk_process_instance_process_definitionId_idx/fk_procInst_procDefId_idx/g
s/fk_flownode_instance_actorId_idx/fk_flnInst_actId_idx/g
s/fk_flownode_instance_tenantId_idx/fk_flnInst_tenId_idx/g
s/fk_transition_instance_tenantId_idx/fk_trsInst_tenId_idx/g
s/fk_connector_instance_tenantId_idx/fk_conInst_tenId_idx/g
s/fk_event_trigger_instance_tenantId_idx/fk_evtTrg_tenId_idx/g
s/fk_waiting_event_flownode_instanceId_idx/fk_waitEvt_flnId_idx/g
s/fk_waiting_event_process_definitionId_idx/fk_wEvt_procDefId_idx/g
s/fk_message_instance_tenantId_idx/fk_msgInst_tenId_idx/g
s/fk_message_instance_process_definitionId_idx/fk_msg_procDef_idx/g
s/fk_pending_mapping_tenantId_idx/fk_pMap_tenId_idx/g
s/fk_pending_mapping_flownode_instanceId/fk_pMap_flnId/g
s/fk_hidden_activity_tenantId_idx/fk_hideAct_tenId_idx/g
s/fk_breakpoint_process_definitionId_idx/fk_bk_ProcDefId_idx/g
s/fk_breakpoint_process_instanceId_idx/fk_bk_procInstId_idx/g
s/fk_arch_process_instance_process_definitionId_idx/fk_Aproc_procDef_idx/g
s/fk_arch_process_instance_tenantId_idx/fk_AProc_tenId_idx/g
s/fk_arch_flownode_instance_tenantId_idx/fk_AFln_tenId_idx/g
s/fk_arch_transition_instance_tenantId_idx/fk_ATrans_tenId_idx/g
s/fk_processsupervisor_user_Id_idx/fk_procSup_usrId_idx/g
s/fk_processsupervisor_group_Id_idx/fk_procSup_grpId_idx/g
s/fk_processsupervisor_roleId_idx/fk_procSup_roleId_idx/g
s/fk_processsupervisor_tenantId_idx/fk_procSup_tentId_idx/g
s/fk_processsupervisor_process_definitionId_idx/fk_procSup_procDef_idx/g
s/fk_processcategorymapping_process_instanceId_idx/fk_procCatMap_proc_idx/g
s/fk_processcategorymapping_tenantId_idx/fk_procCatMap_tenId_idx/g
s/fk_arch_process_comment_user_Id_idx/fk_AprocCom_usrId_idx/g
s/fk_arch_process_comment_arch_process_instanceId_idx/fk_AProcCom_AProc_idx/g
s/fk_arch_process_comment_tenantId_idx/fk_AProcCom_tenId_idx/g
s/fk_arch_data_instance_tenantId_idx/fk_AData_tenId_idx/g
s/fk_arch_data_mapping_tenantId_idx/fk_ADataMap_tenId_idx/g
s/fk_datasourceparameter_tenantId/fk_DSParam_tenId/g
s/fk_event_trigger_instance_tenantId/fk_EvtTrig_tenId/g
s/fk_external_identity_mapping_tenantId/fk_extIdMap_tenId/g
s/fk_processcategorymapping_tenantId/fk_procCatMap_tenId/g
s/fk_transition_instance_tenantId/fk_transInst_tenId/g
s/fk_arch_document_mapping_tenantId/fk_ADocMap_tenId/g
s/fk_arch_flownode_instance_tenantId/fk_AFln_tenId/g
s/fk_arch_process_comment_tenantId/fk_AProcCom_tenId/g
s/fk_arch_process_instance_tenantId/fk_AProc_tenId/g
s/fk_arch_transition_instance_tenantId/fk_ATrans_tenId/g
s/FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS/FK_QRTZ_CRON_TRIGGERS/g
s/FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS/FK_QRTZ_SIMPLE_TRIGGERS/g
s/FK_QRTZ_SIMPROP_TRIGGERS_QRTZ_TRIGGERS/FK_QRTZ_SIMPROP_TRIGGERS/g
s/FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS/FK_QRTZ_TRIGGERS/g
s/idx_datasourceparameter_datasourceid/idx_datasourceprm_datasourceid/g
s/fk_datasourceparameter_tenantId/fk_DSParam_tenId/g
s/fk_event_trigger_instance_tenantId/fk_EvtTrig_tenId/g
s/fk_external_identity_mapping_tenantId/fk_extIdMap_tenId/g
s/fk_processcategorymapping_tenantId/fk_procCatMap_tenId/g
s/fk_transition_instance_tenantId/fk_transInst_tenId/g
s/fk_arch_document_mapping_tenantId/fk_ADocMap_tenId/g
s/fk_arch_flownode_instance_tenantId/fk_AFln_tenId/g
s/fk_arch_process_comment_tenantId/fk_AProcCom_tenId/g
s/fk_arch_process_instance_tenantId/fk_AProc_tenId/g
s/fk_arch_transition_instance_tenantId/fk_ATrans_tenId/g


/fk_actor_tenantId/d
/fk_actormember_tenantId/d
/fk_breakpoint_tenantId/d
/fk_category_tenantId/d
/fk_command_tenantId/d
/fk_connector_instance_tenantId/d
/fk_flownode_instance_tenantId/d
/fk_group__tenantId/d
/fk_hidden_activity_tenantId/d
/fk_message_instance_tenantId/d
/fk_p_metadata_def_tenantId/d
/fk_p_metadata_val_tenantId/d
/fk_pending_mapping_tenantId/d
/fk_process_comment_tenantId/d
/fk_process_definition_tenantId/d
/fk_process_instance_tenantId/d
/fk_role_tenantId/d
/fk_user__tenantId/d
/fk_user_membership_tenantId/d
/fk_waiting_event_tenantId/d
/fk_profileentry_profileId/d
/fk_profilemember_profileId/d
/fk_arch_data_instance_tenantId/d
/fk_arch_data_mapping_tenantId/d

/idx_pdependencymapping_depid/d
/idx_pdependency_name/d
/idx_role_name/d
/idx_user_name/d
/idx_user_contactinfo/d
/idx_p_metadata_def_name/d
/idx_custom_usr_inf_def_name/d
/--/d

/fk_evtTrig_fln_Id_idx/d
/fk_procDef_catId_idx/d
/fk_actormember_actorId_idx/d
/fk_actormember_user_Id_idx/d
/fk_actormember_roleId_idx/d
/fk_actormember_group_Id_idx/d
/fk_actPrv_bosPrvId_idx/d
/fk_actPrv_tenId_idx/d
/fk_dataMap_dataInstId_idx/d
/fk_depMap_tenId_idx/d
/fk_docCont_tenId_idx/d
/fk_docMap_tenId_idx/d

