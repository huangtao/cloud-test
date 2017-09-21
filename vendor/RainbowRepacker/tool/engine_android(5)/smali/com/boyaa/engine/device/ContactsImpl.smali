.class public Lcom/boyaa/engine/device/ContactsImpl;
.super Ljava/lang/Object;
.source "ContactsImpl.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCount()I
    .locals 9

    .prologue
    .line 82
    const/4 v6, 0x0

    .line 83
    .local v6, "count":I
    const/4 v7, 0x0

    .line 85
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v7

    .line 94
    :goto_0
    if-eqz v7, :cond_0

    .line 95
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v6

    .line 96
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 98
    :cond_0
    return v6

    .line 86
    :catch_0
    move-exception v8

    .line 87
    .local v8, "e":Ljava/lang/SecurityException;
    invoke-virtual {v8}, Ljava/lang/SecurityException;->printStackTrace()V

    .line 88
    const/4 v7, 0x0

    goto :goto_0

    .line 89
    .end local v8    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v8

    .line 90
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    .line 91
    const/4 v7, 0x0

    goto :goto_0
.end method

.method public static init()V
    .locals 0

    .prologue
    .line 14
    return-void
.end method

.method public static read(III)Ljava/util/ArrayList;
    .locals 22
    .param p0, "start"    # I
    .param p1, "num"    # I
    .param p2, "sort"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/boyaa/engine/device/Contact;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    move/from16 v17, p0

    .line 107
    .local v17, "start1":I
    if-gez v17, :cond_0

    .line 108
    invoke-static {}, Lcom/boyaa/engine/device/ContactsImpl;->getCount()I

    move-result v10

    .line 109
    .local v10, "count":I
    add-int v17, v17, v10

    .line 114
    .end local v10    # "count":I
    :cond_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .local v9, "contacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/engine/device/Contact;>;"
    if-gtz p1, :cond_1

    .line 165
    :goto_0
    return-object v9

    .line 118
    :cond_1
    invoke-static {}, Lcom/boyaa/engine/device/ContactsImpl;->readPhones()Ljava/util/HashMap;

    move-result-object v16

    .line 121
    .local v16, "phones":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/boyaa/engine/device/Contact;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 122
    .local v18, "timeBegin":J
    const/4 v2, 0x2

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "_id"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "display_name"

    aput-object v3, v4, v2

    .line 123
    .local v4, "projection":[Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "display_name COLLATE LOCALIZED ASC limit "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 125
    .local v7, "sortOrder":Ljava/lang/String;
    const/4 v11, 0x0

    .line 127
    .local v11, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v11

    .line 136
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v20, v2, v18

    .line 137
    .local v20, "timeEnd":J
    const-string v2, ""

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "query contacts "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v0, v20

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 140
    if-eqz v11, :cond_2

    .line 142
    const-string v2, "_id"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 143
    .local v13, "idxId":I
    const-string v2, "display_name"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    .line 145
    .local v14, "idxName":I
    :goto_2
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_3

    .line 161
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 163
    .end local v13    # "idxId":I
    .end local v14    # "idxName":I
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v20, v2, v18

    .line 164
    const-string v2, ""

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "loop contacts "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v0, v20

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 128
    .end local v20    # "timeEnd":J
    :catch_0
    move-exception v12

    .line 129
    .local v12, "e":Ljava/lang/SecurityException;
    invoke-virtual {v12}, Ljava/lang/SecurityException;->printStackTrace()V

    .line 130
    const/4 v11, 0x0

    goto :goto_1

    .line 131
    .end local v12    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v12

    .line 132
    .local v12, "e":Ljava/lang/Exception;
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V

    .line 133
    const/4 v11, 0x0

    goto :goto_1

    .line 146
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v13    # "idxId":I
    .restart local v14    # "idxName":I
    .restart local v20    # "timeEnd":J
    :cond_3
    new-instance v8, Lcom/boyaa/engine/device/Contact;

    invoke-direct {v8}, Lcom/boyaa/engine/device/Contact;-><init>()V

    .line 148
    .local v8, "contact":Lcom/boyaa/engine/device/Contact;
    invoke-interface {v11, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/boyaa/engine/device/Contact;->id:Ljava/lang/String;

    .line 150
    invoke-interface {v11, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/boyaa/engine/device/Contact;->name:Ljava/lang/String;

    .line 152
    iget-object v2, v8, Lcom/boyaa/engine/device/Contact;->id:Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/boyaa/engine/device/Contact;

    .line 153
    .local v15, "phone":Lcom/boyaa/engine/device/Contact;
    if-eqz v15, :cond_4

    .line 154
    iget-object v2, v15, Lcom/boyaa/engine/device/Contact;->mobileNumber:Ljava/lang/String;

    iput-object v2, v8, Lcom/boyaa/engine/device/Contact;->mobileNumber:Ljava/lang/String;

    .line 155
    iget-object v2, v15, Lcom/boyaa/engine/device/Contact;->homeNumber:Ljava/lang/String;

    iput-object v2, v8, Lcom/boyaa/engine/device/Contact;->homeNumber:Ljava/lang/String;

    .line 156
    iget-object v2, v15, Lcom/boyaa/engine/device/Contact;->workNumber:Ljava/lang/String;

    iput-object v2, v8, Lcom/boyaa/engine/device/Contact;->workNumber:Ljava/lang/String;

    .line 157
    iget-object v2, v15, Lcom/boyaa/engine/device/Contact;->otherNumber:Ljava/lang/String;

    iput-object v2, v8, Lcom/boyaa/engine/device/Contact;->otherNumber:Ljava/lang/String;

    .line 159
    :cond_4
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method private static readPhones()Ljava/util/HashMap;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/boyaa/engine/device/Contact;",
            ">;"
        }
    .end annotation

    .prologue
    .line 22
    new-instance v16, Ljava/util/HashMap;

    invoke-direct/range {v16 .. v16}, Ljava/util/HashMap;-><init>()V

    .line 26
    .local v16, "phones":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/boyaa/engine/device/Contact;>;"
    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "contact_id"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "data1"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "data2"

    aput-object v3, v4, v2

    .line 28
    .local v4, "PROJECTION":[Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 29
    .local v17, "timeBegin":J
    const/4 v9, 0x0

    .line 31
    .local v9, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v9

    .line 40
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v19, v2, v17

    .line 41
    .local v19, "timeEnd":J
    const-string v2, ""

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "query phone numbers "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v0, v19

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    if-nez v9, :cond_0

    .line 78
    :goto_1
    return-object v16

    .line 32
    .end local v19    # "timeEnd":J
    :catch_0
    move-exception v10

    .line 33
    .local v10, "e":Ljava/lang/SecurityException;
    invoke-virtual {v10}, Ljava/lang/SecurityException;->printStackTrace()V

    .line 34
    const/4 v9, 0x0

    goto :goto_0

    .line 35
    .end local v10    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v10

    .line 36
    .local v10, "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    .line 37
    const/4 v9, 0x0

    goto :goto_0

    .line 46
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v19    # "timeEnd":J
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 47
    const-string v2, "contact_id"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v12

    .line 48
    .local v12, "indexId":I
    const-string v2, "data1"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 49
    .local v13, "indexNumber":I
    const-string v2, "data2"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    .line 51
    .local v14, "indexType":I
    :goto_2
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 75
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v19, v2, v17

    .line 77
    const-string v2, ""

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "loop phone numbers "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v0, v19

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 52
    :cond_1
    invoke-interface {v9, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 53
    .local v11, "id":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/boyaa/engine/device/Contact;

    .line 54
    .local v8, "contact":Lcom/boyaa/engine/device/Contact;
    if-nez v8, :cond_2

    .line 55
    new-instance v8, Lcom/boyaa/engine/device/Contact;

    .end local v8    # "contact":Lcom/boyaa/engine/device/Contact;
    invoke-direct {v8}, Lcom/boyaa/engine/device/Contact;-><init>()V

    .line 56
    .restart local v8    # "contact":Lcom/boyaa/engine/device/Contact;
    move-object/from16 v0, v16

    invoke-virtual {v0, v11, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    :cond_2
    invoke-interface {v9, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 59
    .local v15, "number":Ljava/lang/String;
    invoke-interface {v9, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    .line 60
    .local v21, "type":I
    packed-switch v21, :pswitch_data_0

    .line 71
    iput-object v15, v8, Lcom/boyaa/engine/device/Contact;->otherNumber:Ljava/lang/String;

    goto :goto_2

    .line 62
    :pswitch_0
    iput-object v15, v8, Lcom/boyaa/engine/device/Contact;->mobileNumber:Ljava/lang/String;

    goto :goto_2

    .line 65
    :pswitch_1
    iput-object v15, v8, Lcom/boyaa/engine/device/Contact;->homeNumber:Ljava/lang/String;

    goto :goto_2

    .line 68
    :pswitch_2
    iput-object v15, v8, Lcom/boyaa/engine/device/Contact;->workNumber:Ljava/lang/String;

    goto :goto_2

    .line 60
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public static search(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 25
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/boyaa/engine/device/Contact;",
            ">;"
        }
    .end annotation

    .prologue
    .line 170
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "%"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 171
    .local v17, "key1":Ljava/lang/String;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .local v9, "contacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/engine/device/Contact;>;"
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    .line 175
    .local v18, "maps":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/boyaa/engine/device/Contact;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    .line 177
    .local v20, "timeBegin":J
    const-string v5, "display_name like ? or data1 like ? "

    .line 178
    .local v5, "selection":Ljava/lang/String;
    const/4 v2, 0x2

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v17, v6, v2

    const/4 v2, 0x1

    aput-object v17, v6, v2

    .line 179
    .local v6, "selectionArgs":[Ljava/lang/String;
    const-string v7, "display_name COLLATE LOCALIZED ASC"

    .line 181
    .local v7, "sortOrder":Ljava/lang/String;
    const/4 v10, 0x0

    .line 183
    .local v10, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v10

    .line 192
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v22, v2, v20

    .line 193
    .local v22, "timeEnd":J
    const-string v2, ""

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "search contacts "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v0, v22

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    .line 196
    if-eqz v10, :cond_0

    .line 198
    const-string v2, "contact_id"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 199
    .local v13, "idxId":I
    const-string v2, "display_name"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    .line 200
    .local v14, "idxName":I
    const-string v2, "data2"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 201
    .local v16, "indexType":I
    const-string v2, "data1"

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 203
    .local v15, "idxNum":I
    :goto_1
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 232
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 234
    .end local v13    # "idxId":I
    .end local v14    # "idxName":I
    .end local v15    # "idxNum":I
    .end local v16    # "indexType":I
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v22, v2, v20

    .line 235
    const-string v2, ""

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "loop contacts "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide/from16 v0, v22

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    return-object v9

    .line 184
    .end local v22    # "timeEnd":J
    :catch_0
    move-exception v11

    .line 185
    .local v11, "e":Ljava/lang/SecurityException;
    invoke-virtual {v11}, Ljava/lang/SecurityException;->printStackTrace()V

    .line 186
    const/4 v10, 0x0

    goto :goto_0

    .line 187
    .end local v11    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v11

    .line 188
    .local v11, "e":Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    .line 189
    const/4 v10, 0x0

    goto :goto_0

    .line 204
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v13    # "idxId":I
    .restart local v14    # "idxName":I
    .restart local v15    # "idxNum":I
    .restart local v16    # "indexType":I
    .restart local v22    # "timeEnd":J
    :cond_1
    invoke-interface {v10, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 205
    .local v12, "id":Ljava/lang/String;
    invoke-interface {v10, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 206
    .local v19, "number":Ljava/lang/String;
    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/boyaa/engine/device/Contact;

    .line 207
    .local v8, "contact":Lcom/boyaa/engine/device/Contact;
    if-nez v8, :cond_2

    .line 208
    new-instance v8, Lcom/boyaa/engine/device/Contact;

    .end local v8    # "contact":Lcom/boyaa/engine/device/Contact;
    invoke-direct {v8}, Lcom/boyaa/engine/device/Contact;-><init>()V

    .line 209
    .restart local v8    # "contact":Lcom/boyaa/engine/device/Contact;
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    iput-object v12, v8, Lcom/boyaa/engine/device/Contact;->id:Ljava/lang/String;

    .line 211
    invoke-interface {v10, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/boyaa/engine/device/Contact;->name:Ljava/lang/String;

    .line 213
    move-object/from16 v0, v18

    invoke-virtual {v0, v12, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    :cond_2
    move/from16 v0, v16

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v24

    .line 217
    .local v24, "type":I
    packed-switch v24, :pswitch_data_0

    .line 228
    move-object/from16 v0, v19

    iput-object v0, v8, Lcom/boyaa/engine/device/Contact;->otherNumber:Ljava/lang/String;

    goto :goto_1

    .line 219
    :pswitch_0
    move-object/from16 v0, v19

    iput-object v0, v8, Lcom/boyaa/engine/device/Contact;->mobileNumber:Ljava/lang/String;

    goto :goto_1

    .line 222
    :pswitch_1
    move-object/from16 v0, v19

    iput-object v0, v8, Lcom/boyaa/engine/device/Contact;->homeNumber:Ljava/lang/String;

    goto :goto_1

    .line 225
    :pswitch_2
    move-object/from16 v0, v19

    iput-object v0, v8, Lcom/boyaa/engine/device/Contact;->workNumber:Ljava/lang/String;

    goto :goto_1

    .line 217
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
