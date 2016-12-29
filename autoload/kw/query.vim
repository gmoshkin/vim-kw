if !exists("g:kw_checkers_cs")
    let g:kw_checkers_cs = [
        \ "CS.ASSIGN.SELF",
        \ "CS.CMP.VAL.NULL",
        \ "CS.CONSTCOND.DO",
        \ "CS.CONSTCOND.IF",
        \ "CS.CONSTCOND.SWITCH",
        \ "CS.CONSTCOND.TERNARY",
        \ "CS.CONSTCOND.WHILE",
        \ "CS.CTOR.VIRTUAL",
        \ "CS.EMPTY.CATCH",
        \ "CS.FLOAT.EQCHECK",
        \ "CS.FRACTION.LOSS",
        \ "CS.HIDDEN.MEMBER.LOCAL.CLASS",
        \ "CS.HIDDEN.MEMBER.LOCAL.STRUCT",
        \ "CS.HIDDEN.MEMBER.PARAM.CLASS",
        \ "CS.HIDDEN.MEMBER.PARAM.STRUCT",
        \ "CS.IFACE.EMPTY",
        \ "CS.LOOP.STR.CONCAT",
        \ "CS.NPS",
        \ "CS.NRE.CHECK.CALL.MIGHT",
        \ "CS.NRE.CHECK.CALL.MUST",
        \ "CS.NRE.CHECK.MIGHT",
        \ "CS.NRE.CHECK.MUST",
        \ "CS.NRE.CONST.CALL",
        \ "CS.NRE.CONST.DEREF",
        \ "CS.NRE.FUNC.CALL.MIGHT",
        \ "CS.NRE.FUNC.CALL.MUST",
        \ "CS.NRE.FUNC.MIGHT",
        \ "CS.NRE.FUNC.MUST",
        \ "CS.NRE.GEN.CALL.MIGHT",
        \ "CS.NRE.GEN.CALL.MUST",
        \ "CS.NRE.GEN.MIGHT",
        \ "CS.NRE.GEN.MUST",
        \ "CS.OVRD.EQUALS",
        \ "CS.RCA",
        \ "CS.RLK",
        \ "CS.RNRE",
        \ "CS.SQL.INJECT.LOCAL",
        \ "CS.UNCHECKED.CAST",
        \ "CS.UNCHECKED.LOOPITER.CAST",
        \ "CS.WRONG.CAST",
        \ "CS.WRONG.CAST.MIGHT",
        \ "CS.WRONGSIG.CMPTO",
        \ "CS.WRONGUSE.REFEQ",
        \ ]
endif
if !exists("g:kw_checkers_cpp")
    let g:kw_checkers_cpp = [
        \ "ABV.ANY_SIZE_ARRAY",
        \ "ABV.GENERAL",
        \ "ABV.ITERATOR",
        \ "ABV.MEMBER",
        \ "ABV.STACK",
        \ "ABV.TAINTED",
        \ "ABV.UNICODE.BOUND_MAP",
        \ "ABV.UNICODE.FAILED_MAP",
        \ "ABV.UNICODE.NNTS_MAP",
        \ "ABV.UNICODE.SELF_MAP",
        \ "ABV.UNKNOWN_SIZE",
        \ "ASSIGCOND.CALL",
        \ "ASSIGCOND.GEN",
        \ "BSTR.CAST.C",
        \ "BSTR.CAST.CPP",
        \ "BSTR.FUNC.ALLOC",
        \ "BSTR.FUNC.FREE",
        \ "BSTR.FUNC.LEN",
        \ "BSTR.FUNC.REALLOC",
        \ "BSTR.IA.ASSIGN",
        \ "BSTR.IA.INIT",
        \ "BSTR.OPS.ARITHM",
        \ "BSTR.OPS.COMP",
        \ "BSTR.OPS.EQS",
        \ "BYTEORDER.HTON.SEND",
        \ "BYTEORDER.HTON.WRITE",
        \ "BYTEORDER.NTOH.READ",
        \ "BYTEORDER.NTOH.RECV",
        \ "CL.ASSIGN.NON_CONST_ARG",
        \ "CL.ASSIGN.RETURN_CONST",
        \ "CL.ASSIGN.VOID",
        \ "CL.FFM.ASSIGN",
        \ "CL.FFM.COPY",
        \ "CL.FMM",
        \ "CL.MLK",
        \ "CL.MLK.ASSIGN",
        \ "CL.MLK.VIRTUAL",
        \ "CL.SELF-ASSIGN",
        \ "CL.SHALLOW.ASSIGN",
        \ "CL.SHALLOW.COPY",
        \ "CONC.DL",
        \ "CONC.NO_UNLOCK",
        \ "CONC.SLEEP",
        \ "CWARN.ALIGNMENT",
        \ "CWARN.BAD.PTR.ARITH",
        \ "CWARN.BITOP.SIZE",
        \ "CWARN.BOOLOP.INC",
        \ "CWARN.CAST.VIRTUAL_INHERITANCE",
        \ "CWARN.CMPCHR.EOF",
        \ "CWARN.CONSTCOND.DO",
        \ "CWARN.CONSTCOND.IF",
        \ "CWARN.CONSTCOND.SWITCH",
        \ "CWARN.CONSTCOND.TERNARY",
        \ "CWARN.CONSTCOND.WHILE",
        \ "CWARN.COPY.NOASSIGN",
        \ "CWARN.DTOR.NONVIRT.DELETE",
        \ "CWARN.DTOR.NONVIRT.NOTEMPTY",
        \ "CWARN.EMPTY.LABEL",
        \ "CWARN.EMPTY.TYPEDEF",
        \ "CWARN.FUNCADDR",
        \ "CWARN.HIDDEN.PARAM",
        \ "CWARN.IMPLICITINT",
        \ "CWARN.INCL.ABSOLUTE",
        \ "CWARN.INCL.NO_INTERFACE",
        \ "CWARN.INLINE.NONFUNC",
        \ "CWARN.MEMBER.INIT.ORDER",
        \ "CWARN.MEM.NONPOD",
        \ "CWARN.MEMSET.SIZEOF.PTR",
        \ "CWARN.NOEFFECT.OUTOFRANGE",
        \ "CWARN.NOEFFECT.SELF_ASSIGN",
        \ "CWARN.NOEFFECT.UCMP.GE",
        \ "CWARN.NOEFFECT.UCMP.GE.MACRO",
        \ "CWARN.NOEFFECT.UCMP.LT",
        \ "CWARN.NOEFFECT.UCMP.LT.MACRO",
        \ "CWARN.NULLCHECK.FUNCNAME",
        \ "CWARN.OVERRIDE.CONST",
        \ "CWARN.PACKED.TYPEDEF",
        \ "CWARN.PASSBYVALUE.ARG",
        \ "CWARN.PASSBYVALUE.EXC",
        \ "CWARN.RET.MAIN",
        \ "CWARN.SIGNEDBIT",
        \ "DBZ.CONST",
        \ "DBZ.CONST.CALL",
        \ "DBZ.GENERAL",
        \ "DBZ.ITERATOR",
        \ "EFFECT",
        \ "FMM.MIGHT",
        \ "FMM.MUST",
        \ "FNH.MIGHT",
        \ "FNH.MUST",
        \ "FREE.INCONSISTENT",
        \ "FUM.GEN.MIGHT",
        \ "FUM.GEN.MUST",
        \ "FUNCRET.GEN",
        \ "FUNCRET.IMPLICIT",
        \ "HCC",
        \ "HCC.PWD",
        \ "HCC.USER",
        \ "INCONSISTENT.LABEL",
        \ "INCORRECT.ALLOC_SIZE",
        \ "INFINITE_LOOP.GLOBAL",
        \ "INFINITE_LOOP.LOCAL",
        \ "INFINITE_LOOP.MACRO",
        \ "INVARIANT_CONDITION.GEN",
        \ "INVARIANT_CONDITION.UNREACH",
        \ "ITER.CONTAINER.MODIFIED",
        \ "ITER.END.DEREF.MIGHT",
        \ "ITER.END.DEREF.MUST",
        \ "ITER.INAPPROPRIATE",
        \ "ITER.INAPPROPRIATE.MULTIPLE",
        \ "LA_UNUSED",
        \ "LOCRET.ARG",
        \ "LOCRET.GLOB",
        \ "LOCRET.RET",
        \ "LS.CALL",
        \ "LS.CALL.STRING",
        \ "LV_UNUSED.GEN",
        \ "MLK.MIGHT",
        \ "MLK.MUST",
        \ "MLK.RET.MIGHT",
        \ "MLK.RET.MUST",
        \ "NNTS.MIGHT",
        \ "NNTS.MUST",
        \ "NNTS.TAINTED",
        \ "NPD.CHECK.CALL.MIGHT",
        \ "NPD.CHECK.CALL.MUST",
        \ "NPD.CHECK.MIGHT",
        \ "NPD.CHECK.MUST",
        \ "NPD.CONST.CALL",
        \ "NPD.CONST.DEREF",
        \ "NPD.FUNC.CALL.MIGHT",
        \ "NPD.FUNC.CALL.MUST",
        \ "NPD.FUNC.MIGHT",
        \ "NPD.FUNC.MUST",
        \ "NPD.GEN.CALL.MIGHT",
        \ "NPD.GEN.CALL.MUST",
        \ "NPD.GEN.MIGHT",
        \ "NPD.GEN.MUST",
        \ "NUM.OVERFLOW",
        \ "PORTING.BITFIELDS",
        \ "PORTING.BSWAP.MACRO",
        \ "PORTING.BYTEORDER.SIZE",
        \ "PORTING.CAST.FLTPNT",
        \ "PORTING.CAST.PTR",
        \ "PORTING.CAST.PTR.FLTPNT",
        \ "PORTING.CAST.PTR.SIZE",
        \ "PORTING.CAST.SIZE",
        \ "PORTING.CMPSPEC.EFFECTS.ASSIGNMENT",
        \ "PORTING.CMPSPEC.TYPE.BOOL",
        \ "PORTING.CMPSPEC.TYPE.LONGLONG",
        \ "PORTING.MACRO.NUMTYPE",
        \ "PORTING.OPTS",
        \ "PORTING.PRAGMA.ALIGN",
        \ "PORTING.PRAGMA.PACK",
        \ "PORTING.SIGNED.CHAR",
        \ "PORTING.STORAGE.STRUCT",
        \ "PORTING.STRUCT.BOOL",
        \ "PORTING.UNIONS",
        \ "PORTING.UNSIGNEDCHAR.OVERFLOW.FALSE",
        \ "PORTING.UNSIGNEDCHAR.OVERFLOW.TRUE",
        \ "PORTING.UNSIGNEDCHAR.RELOP",
        \ "PORTING.VAR.EFFECTS",
        \ "PRECISION.LOSS",
        \ "PRECISION.LOSS.CALL",
        \ "RABV.CHECK",
        \ "RCA",
        \ "RCA.HASH.SALT.EMPTY",
        \ "RETVOID.GEN",
        \ "RETVOID.IMPLICIT",
        \ "RH.LEAK",
        \ "RN.INDEX",
        \ "RNPD.CALL",
        \ "RNPD.DEREF",
        \ "SEMICOL",
        \ "STRONG.TYPE.ASSIGN",
        \ "STRONG.TYPE.ASSIGN.ARG",
        \ "STRONG.TYPE.ASSIGN.CONST",
        \ "STRONG.TYPE.ASSIGN.INIT",
        \ "STRONG.TYPE.ASSIGN.RETURN",
        \ "STRONG.TYPE.ASSIGN.ZERO",
        \ "STRONG.TYPE.EXTRACT",
        \ "STRONG.TYPE.JOIN.CMP",
        \ "STRONG.TYPE.JOIN.CONST",
        \ "STRONG.TYPE.JOIN.EQ",
        \ "STRONG.TYPE.JOIN.OTHER",
        \ "STRONG.TYPE.JOIN.ZERO",
        \ "SV.BANNED.RECOMMENDED.ALLOCA",
        \ "SV.BANNED.RECOMMENDED.NUMERIC",
        \ "SV.BANNED.RECOMMENDED.OEM",
        \ "SV.BANNED.RECOMMENDED.PATH",
        \ "SV.BANNED.RECOMMENDED.SCANF",
        \ "SV.BANNED.RECOMMENDED.SPRINTF",
        \ "SV.BANNED.RECOMMENDED.STRLEN",
        \ "SV.BANNED.RECOMMENDED.TOKEN",
        \ "SV.BANNED.RECOMMENDED.WINDOW",
        \ "SV.BANNED.REQUIRED.CONCAT",
        \ "SV.BANNED.REQUIRED.COPY",
        \ "SV.BANNED.REQUIRED.GETS",
        \ "SV.BANNED.REQUIRED.ISBAD",
        \ "SV.BANNED.REQUIRED.SPRINTF",
        \ "SV.BFC.USING_STRUCT",
        \ "SV.BRM.HKEY_LOCAL_MACHINE",
        \ "SV.CODE_INJECTION.SHELL_EXEC",
        \ "SV.DLLPRELOAD.NONABSOLUTE.DLL",
        \ "SV.DLLPRELOAD.NONABSOLUTE.EXE",
        \ "SV.DLLPRELOAD.SEARCHPATH",
        \ "SV.FIU.PROCESS_VARIANTS",
        \ "SV.FMTSTR.GENERIC",
        \ "SV.FMT_STR.BAD_SCAN_FORMAT",
        \ "SV.FMT_STR.PRINT_FORMAT_MISMATCH.BAD",
        \ "SV.FMT_STR.PRINT_FORMAT_MISMATCH.UNDESIRED",
        \ "SV.FMT_STR.PRINT_IMPROP_LENGTH",
        \ "SV.FMT_STR.PRINT_PARAMS_WRONGNUM.FEW",
        \ "SV.FMT_STR.PRINT_PARAMS_WRONGNUM.MANY",
        \ "SV.FMT_STR.SCAN_FORMAT_MISMATCH.BAD",
        \ "SV.FMT_STR.SCAN_FORMAT_MISMATCH.UNDESIRED",
        \ "SV.FMT_STR.SCAN_IMPROP_LENGTH",
        \ "SV.FMT_STR.SCAN_PARAMS_WRONGNUM.FEW",
        \ "SV.FMT_STR.SCAN_PARAMS_WRONGNUM.MANY",
        \ "SV.FMT_STR.UNKWN_FORMAT",
        \ "SV.FMT_STR.UNKWN_FORMAT.SCAN",
        \ "SV.INCORRECT_RESOURCE_HANDLING.URH",
        \ "SV.INCORRECT_RESOURCE_HANDLING.WRONG_STATUS",
        \ "SV.LPP.CONST",
        \ "SV.LPP.VAR",
        \ "SV.PCC.CONST",
        \ "SV.PCC.INVALID_TEMP_PATH",
        \ "SV.PCC.MISSING_TEMP_CALLS.MUST",
        \ "SV.PCC.MISSING_TEMP_FILENAME",
        \ "SV.PCC.MODIFIED_BEFORE_CREATE",
        \ "SV.PIPE.CONST",
        \ "SV.PIPE.VAR",
        \ "SV.RVT.RETVAL_NOTTESTED",
        \ "SV.SIP.CONST",
        \ "SV.SIP.VAR",
        \ "SV.STRBO.BOUND_COPY.OVERFLOW",
        \ "SV.STRBO.BOUND_COPY.UNTERM",
        \ "SV.STRBO.BOUND_SPRINTF",
        \ "SV.STRBO.UNBOUND_COPY",
        \ "SV.STRBO.UNBOUND_SPRINTF",
        \ "SV.STR_PAR.UNDESIRED_STRING_PARAMETER",
        \ "SV.TAINTED.ALLOC_SIZE",
        \ "SV.TAINTED.BINOP",
        \ "SV.TAINTED.CALL.BINOP",
        \ "SV.TAINTED.CALL.DEREF",
        \ "SV.TAINTED.CALL.INDEX_ACCESS",
        \ "SV.TAINTED.CALL.LOOP_BOUND",
        \ "SV.TAINTED.DEREF",
        \ "SV.TAINTED.FMTSTR",
        \ "SV.TAINTED.INDEX_ACCESS",
        \ "SV.TAINTED.INJECTION",
        \ "SV.TAINTED.LOOP_BOUND",
        \ "SV.TAINTED.PATH_TRAVERSAL",
        \ "SV.TAINTED.SECURITY_DECISION",
        \ "SV.TOCTOU.FILE_ACCESS",
        \ "SV.UNBOUND_STRING_INPUT.CIN",
        \ "SV.UNBOUND_STRING_INPUT.FUNC",
        \ "SV.USAGERULES.PERMISSIONS",
        \ "SV.USAGERULES.PROCESS_VARIANTS",
        \ "SV.USAGERULES.SPOOFING",
        \ "SV.WEAK_CRYPTO.WEAK_HASH",
        \ "UFM.DEREF.MIGHT",
        \ "UFM.DEREF.MUST",
        \ "UFM.FFM.MIGHT",
        \ "UFM.FFM.MUST",
        \ "UFM.RETURN.MIGHT",
        \ "UFM.RETURN.MUST",
        \ "UFM.USE.MIGHT",
        \ "UFM.USE.MUST",
        \ "UNINIT.CTOR.MIGHT",
        \ "UNINIT.CTOR.MUST",
        \ "UNINIT.HEAP.MIGHT",
        \ "UNINIT.HEAP.MUST",
        \ "UNINIT.STACK.ARRAY.MIGHT",
        \ "UNINIT.STACK.ARRAY.MUST",
        \ "UNINIT.STACK.ARRAY.PARTIAL.MUST",
        \ "UNINIT.STACK.MIGHT",
        \ "UNINIT.STACK.MUST",
        \ "UNREACH.GEN",
        \ "UNREACH.RETURN",
        \ "UNREACH.SIZEOF",
        \ "UNUSED.FUNC.GEN",
        \ "UNUSED.FUNC.WARN",
        \ "VA_UNUSED.GEN",
        \ "VA_UNUSED.INIT",
        \ "VOIDRET",
        \ ]
endif

function! kw#query#update_checkers(codes) abort
    "TODO
endfunction

function! kw#query#complete_checkers(ArgLead, CmdLine, CursorPos) abort
    " TODO: complete subcodes separated buy "."
    return kw#utils#complete(g:kw_checkers_cs + g:kw_checkers_cpp, a:ArgLead)
endfunction

function! kw#query#get_query(key) abort
    " TODO: refactor, remove duplicate code
    if a:key ==? "code"
        if !exists("g:kw_last_code")
            let g:kw_last_code = ""
        endif
        let default = g:kw_last_code
        let res = input("Checker code: ", default, "customlist,kw#query#complete_checkers")
        let g:kw_last_code = res
        return g:kw_last_code
    elseif a:key ==? "status"
        if !exists("g:kw_last_status")
            let g:kw_last_status = ""
        endif
        let default = g:kw_last_status
        let res = input("Status: ", default, "customlist,kw#history#complete_status")
        let g:kw_last_status = res
        return "%2B".g:kw_last_status
    elseif a:key ==? "id"
        if !exists("g:kw_last_id")
            let g:kw_last_id = ""
        endif
        let default = g:kw_last_id
        let res = input("Id: ", default, "customlist,kw#history#complete_id")
        let g:kw_last_id = res
        call kw#history#add("id", res)
        return res
    endif
endfunction

function! kw#query#search_query(query, action) abort
    let params = {
        \ "query" : a:query
        \ }
    return kw#request#request("search", params, a:action)
endfunction

function! kw#query#search_queries(load, ...) abort
    if a:0 == 0
        return
    endif
    let query_params = []
    for a in a:000
        call add(query_params, a.":".kw#query#get_query(a))
    endfor
    let g:kw_last_query = join(query_params, "%2C")
    if a:load
        let response = kw#query#search_query(g:kw_last_query, "load")
        call kw#parse#issues(response)
    else
        call kw#query#search_query(g:kw_last_query, "read")
    endif
endfunction

function! kw#query#search_last_query() abort
    if !exists("g:kw_last_query")
        echoerr "g:kw_last_query is not set"
        return
    endif
    call kw#query#search_query(g:kw_last_query, "read")
endfunction

