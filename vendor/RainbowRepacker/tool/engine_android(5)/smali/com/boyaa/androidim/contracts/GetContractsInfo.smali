.class public Lcom/boyaa/androidim/contracts/GetContractsInfo;
.super Ljava/lang/Object;
.source "GetContractsInfo.java"


# static fields
.field static jsonData:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-string v0, ""

    sput-object v0, Lcom/boyaa/androidim/contracts/GetContractsInfo;->jsonData:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNumber(Landroid/content/Context;)Ljava/lang/String;
    .locals 18
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "start to loding contract."

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 74
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 75
    .local v14, "jsonObject":Lorg/json/JSONObject;
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 78
    .local v7, "arrayItem":Lorg/json/JSONArray;
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v15, "listMembers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/androidim/utils/ContactMember;>;"
    const/4 v11, 0x0

    .line 83
    .local v11, "cursor":Landroid/database/Cursor;
    :try_start_0
    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    .line 86
    .local v2, "uri":Landroid/net/Uri;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "display_name"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "sort_key"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "contact_id"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, "data1"

    aput-object v5, v3, v4

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v6, "sort_key"

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 87
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 89
    :cond_0
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 91
    .local v13, "item_info":Lorg/json/JSONObject;
    new-instance v8, Lcom/boyaa/androidim/utils/ContactMember;

    invoke-direct {v8}, Lcom/boyaa/androidim/utils/ContactMember;-><init>()V

    .line 93
    .local v8, "contact":Lcom/boyaa/androidim/utils/ContactMember;
    const-string v1, "data1"

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 92
    invoke-interface {v11, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 94
    .local v10, "contact_phone":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 96
    .local v16, "name":Ljava/lang/String;
    const/4 v1, 0x1

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/boyaa/androidim/contracts/GetContractsInfo;->getSortKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 98
    .local v17, "sortKey":Ljava/lang/String;
    const-string v1, "contact_id"

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 100
    .local v9, "contact_id":I
    move-object/from16 v0, v16

    iput-object v0, v8, Lcom/boyaa/androidim/utils/ContactMember;->contact_name:Ljava/lang/String;

    .line 102
    move-object/from16 v0, v17

    iput-object v0, v8, Lcom/boyaa/androidim/utils/ContactMember;->sortKey:Ljava/lang/String;

    .line 104
    iput-object v10, v8, Lcom/boyaa/androidim/utils/ContactMember;->contact_phone:Ljava/lang/String;

    .line 105
    const-string v1, "1"

    invoke-virtual {v10, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v3, 0xb

    if-ge v1, v3, :cond_3

    .line 126
    :cond_1
    :goto_0
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 88
    if-nez v1, :cond_0

    .line 136
    .end local v8    # "contact":Lcom/boyaa/androidim/utils/ContactMember;
    .end local v9    # "contact_id":I
    .end local v10    # "contact_phone":Ljava/lang/String;
    .end local v13    # "item_info":Lorg/json/JSONObject;
    .end local v16    # "name":Ljava/lang/String;
    .end local v17    # "sortKey":Ljava/lang/String;
    :cond_2
    const/16 p0, 0x0

    .line 141
    .end local v2    # "uri":Landroid/net/Uri;
    :goto_1
    :try_start_1
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_5

    .line 143
    const-string v1, "contract_list"

    invoke-virtual {v14, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    invoke-virtual {v14}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 151
    :goto_2
    return-object v1

    .line 108
    .restart local v2    # "uri":Landroid/net/Uri;
    .restart local v8    # "contact":Lcom/boyaa/androidim/utils/ContactMember;
    .restart local v9    # "contact_id":I
    .restart local v10    # "contact_phone":Ljava/lang/String;
    .restart local v13    # "item_info":Lorg/json/JSONObject;
    .restart local v16    # "name":Ljava/lang/String;
    .restart local v17    # "sortKey":Ljava/lang/String;
    :cond_3
    :try_start_2
    const-string v1, "+86"

    invoke-virtual {v10, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 109
    const/4 v1, 0x3

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v10, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 111
    :cond_4
    iput v9, v8, Lcom/boyaa/androidim/utils/ContactMember;->contact_id:I

    .line 113
    if-eqz v16, :cond_1

    .line 115
    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    const-string v1, "phone_number"

    invoke-virtual {v13, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    const-string v1, "name"

    move-object/from16 v0, v16

    invoke-virtual {v13, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 120
    invoke-virtual {v7, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 133
    .end local v2    # "uri":Landroid/net/Uri;
    .end local v8    # "contact":Lcom/boyaa/androidim/utils/ContactMember;
    .end local v9    # "contact_id":I
    .end local v10    # "contact_phone":Ljava/lang/String;
    .end local v13    # "item_info":Lorg/json/JSONObject;
    .end local v16    # "name":Ljava/lang/String;
    .end local v17    # "sortKey":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 134
    .local v12, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 136
    const/16 p0, 0x0

    goto :goto_1

    .line 135
    .end local v12    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    .line 136
    const/16 p0, 0x0

    .line 137
    throw v1

    .line 147
    :cond_5
    const-string v1, ""

    goto :goto_2

    .line 149
    :catch_1
    move-exception v12

    .line 151
    .restart local v12    # "e":Ljava/lang/Exception;
    const-string v1, ""

    goto :goto_2
.end method

.method private static getSortKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "sortKeyString"    # Ljava/lang/String;

    .prologue
    .line 176
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 178
    .local v0, "key":Ljava/lang/String;
    const-string v1, "[A-Z]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 184
    .end local v0    # "key":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "key":Ljava/lang/String;
    :cond_0
    const-string v0, "#"

    goto :goto_0
.end method

.method public static isMobileNO(Ljava/lang/String;)Z
    .locals 2
    .param p0, "mobiles"    # Ljava/lang/String;

    .prologue
    .line 168
    const-string v0, "[1][358]\\d{9}"

    .line 169
    .local v0, "telRegex":Ljava/lang/String;
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    .line 170
    :goto_0
    return v1

    :cond_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method
