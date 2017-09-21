.class public Lcom/boyaa/extension/Contacts;
.super Ljava/lang/Object;
.source "Contacts.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Contacts"

.field private static final TAG_LOG:Ljava/lang/String; = "Contacts"


# instance fields
.field private fail:Ljava/lang/String;

.field private mJsonData:Lorg/json/JSONArray;

.field private mStrFuncName:Ljava/lang/String;

.field private strRet:Ljava/lang/String;

.field private success:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/boyaa/extension/Contacts;->mJsonData:Lorg/json/JSONArray;

    .line 26
    const-string v0, "1"

    iput-object v0, p0, Lcom/boyaa/extension/Contacts;->success:Ljava/lang/String;

    .line 27
    const-string v0, "0"

    iput-object v0, p0, Lcom/boyaa/extension/Contacts;->fail:Ljava/lang/String;

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/extension/Contacts;->strRet:Ljava/lang/String;

    .line 21
    return-void
.end method

.method private callLua(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "strState"    # Ljava/lang/String;
    .param p2, "strContactsInfo"    # Ljava/lang/String;
    .param p3, "strFuncName"    # Ljava/lang/String;

    .prologue
    .line 50
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/extension/Contacts$1;

    invoke-direct {v1, p0, p2, p3}, Lcom/boyaa/extension/Contacts$1;-><init>(Lcom/boyaa/extension/Contacts;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 60
    return-void
.end method

.method private queryPhoneContacts()I
    .locals 12

    .prologue
    .line 63
    const/4 v11, 0x0

    .line 66
    .local v11, "ret":I
    const/4 v7, 0x0

    .line 69
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    .line 70
    .local v1, "uri":Landroid/net/Uri;
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 73
    .local v0, "resolver":Landroid/content/ContentResolver;
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "display_name"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "sort_key"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "contact_id"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "data1"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "sort_key"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 75
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 78
    :cond_0
    const-string v2, "data1"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 77
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 79
    .local v6, "contact_phone":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 81
    .local v10, "name":Ljava/lang/String;
    const-string v2, "1"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xb

    if-ge v2, v3, :cond_4

    .line 95
    :cond_1
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_0

    .line 102
    .end local v6    # "contact_phone":Ljava/lang/String;
    .end local v10    # "name":Ljava/lang/String;
    :cond_2
    if-eqz v7, :cond_3

    .line 103
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 107
    .end local v0    # "resolver":Landroid/content/ContentResolver;
    .end local v1    # "uri":Landroid/net/Uri;
    :cond_3
    :goto_1
    return v11

    .line 84
    .restart local v0    # "resolver":Landroid/content/ContentResolver;
    .restart local v1    # "uri":Landroid/net/Uri;
    .restart local v6    # "contact_phone":Ljava/lang/String;
    .restart local v10    # "name":Ljava/lang/String;
    :cond_4
    :try_start_1
    const-string v2, "+86"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 85
    const/4 v2, 0x3

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v6, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 87
    :cond_5
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 88
    .local v9, "item_info":Lorg/json/JSONObject;
    if-eqz v10, :cond_1

    .line 90
    const-string v2, "phone_number"

    invoke-virtual {v9, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    const-string v2, "name"

    invoke-virtual {v9, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 93
    iget-object v2, p0, Lcom/boyaa/extension/Contacts;->mJsonData:Lorg/json/JSONArray;

    invoke-virtual {v2, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 98
    .end local v0    # "resolver":Landroid/content/ContentResolver;
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v6    # "contact_phone":Ljava/lang/String;
    .end local v9    # "item_info":Lorg/json/JSONObject;
    .end local v10    # "name":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 99
    .local v8, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    const/4 v11, 0x1

    .line 102
    if-eqz v7, :cond_3

    .line 103
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 101
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 102
    if-eqz v7, :cond_6

    .line 103
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 105
    :cond_6
    throw v2
.end method


# virtual methods
.method public execute(Ljava/lang/String;)V
    .locals 1
    .param p1, "strFuncName"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/boyaa/extension/Contacts;->mStrFuncName:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 33
    return-void
.end method

.method public run()V
    .locals 4

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/boyaa/extension/Contacts;->queryPhoneContacts()I

    move-result v0

    .line 40
    .local v0, "phoneResult":I
    if-nez v0, :cond_0

    .line 41
    const-string v1, "Contacts"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "setContactsInfo:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/boyaa/extension/Contacts;->mJsonData:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    iget-object v1, p0, Lcom/boyaa/extension/Contacts;->success:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/extension/Contacts;->mJsonData:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/boyaa/extension/Contacts;->mStrFuncName:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/boyaa/extension/Contacts;->callLua(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    :goto_0
    const-string v1, "Contacts"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "strRet:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/boyaa/extension/Contacts;->strRet:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    return-void

    .line 44
    :cond_0
    iget-object v1, p0, Lcom/boyaa/extension/Contacts;->fail:Ljava/lang/String;

    const-string v2, ""

    iget-object v3, p0, Lcom/boyaa/extension/Contacts;->mStrFuncName:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/boyaa/extension/Contacts;->callLua(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
