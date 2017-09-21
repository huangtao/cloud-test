.class public Lcom/boyaa/godsdk/core/GodSDKConfigParser;
.super Ljava/lang/Object;
.source "GodSDKConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    }
.end annotation


# static fields
.field private static final MARK_PARAMS:Ljava/lang/String; = "Params"

.field private static final MARK_PLUGIN:Ljava/lang/String; = "Plugin"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse(Ljava/io/InputStream;Ljava/lang/String;)Ljava/util/List;
    .locals 18
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .param p1, "encode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 19
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v9

    .line 20
    .local v9, "parser":Lorg/xmlpull/v1/XmlPullParser;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-interface {v9, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 22
    const/4 v11, 0x0

    .line 23
    .local v11, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    const/4 v5, 0x0

    .line 24
    .local v5, "isInPluginMark":Z
    const/4 v4, 0x0

    .line 25
    .local v4, "isInParamsMark":Z
    const/4 v10, 0x0

    .line 26
    .local v10, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    const/4 v8, 0x0

    .line 28
    .local v8, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    .line 30
    .local v2, "eventType":I
    :goto_0
    const/4 v15, 0x1

    if-ne v15, v2, :cond_0

    .line 81
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v15

    invoke-virtual {v15}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "List<Plugin> == "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 82
    return-object v11

    .line 31
    :cond_0
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 33
    .local v7, "name":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 34
    new-instance v11, Ljava/util/ArrayList;

    .end local v11    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .restart local v11    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_1
    :goto_1
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_0

    .line 35
    :cond_2
    const/4 v15, 0x2

    if-ne v2, v15, :cond_9

    .line 36
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v15

    invoke-virtual {v15}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "START_TAG name == "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 37
    const-string v15, "Plugin"

    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 38
    const/4 v5, 0x1

    .line 39
    const/4 v15, 0x0

    const-string v16, "pluginType"

    move-object/from16 v0, v16

    invoke-interface {v9, v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 40
    .local v13, "type":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v15

    invoke-virtual {v15}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "pluginType == "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 41
    new-instance v10, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .end local v10    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-direct {v10}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;-><init>()V

    .line 42
    .restart local v10    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v15

    if-ge v3, v15, :cond_1

    .line 43
    invoke-interface {v9, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v6

    .line 44
    .local v6, "key":Ljava/lang/String;
    invoke-interface {v9, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v14

    .line 46
    .local v14, "value":Ljava/lang/String;
    const-string v15, "className"

    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 47
    invoke-virtual {v10, v14}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->setClassName(Ljava/lang/String;)V

    .line 42
    :cond_3
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 48
    :cond_4
    const-string v15, "versionName"

    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 49
    invoke-virtual {v10, v14}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->setVersionName(Ljava/lang/String;)V

    goto :goto_3

    .line 50
    :cond_5
    const-string v15, "versionCode"

    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 51
    invoke-virtual {v10, v14}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->setVersionCode(Ljava/lang/String;)V

    goto :goto_3

    .line 52
    :cond_6
    const-string v15, "pluginType"

    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 53
    invoke-virtual {v10, v14}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->setPluginType(Ljava/lang/String;)V

    goto :goto_3

    .line 56
    .end local v3    # "i":I
    .end local v6    # "key":Ljava/lang/String;
    .end local v13    # "type":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    :cond_7
    if-eqz v5, :cond_8

    const-string v15, "Params"

    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 57
    const/4 v4, 0x1

    .line 58
    new-instance v8, Ljava/util/HashMap;

    .end local v8    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 59
    .restart local v8    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_1

    :cond_8
    if-eqz v4, :cond_1

    .line 60
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v12

    .line 61
    .local v12, "text":Ljava/lang/String;
    invoke-interface {v8, v7, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v15

    invoke-virtual {v15}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "Params TEXT == "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 65
    .end local v12    # "text":Ljava/lang/String;
    :cond_9
    const/4 v15, 0x3

    if-ne v2, v15, :cond_1

    .line 67
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v15

    invoke-virtual {v15}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "END_TAG name == "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 69
    if-eqz v5, :cond_a

    const-string v15, "Params"

    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_a

    .line 70
    invoke-virtual {v10, v8}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->setParams(Ljava/util/Map;)V

    .line 71
    const/4 v4, 0x0

    .line 72
    goto/16 :goto_1

    :cond_a
    const-string v15, "Plugin"

    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 73
    invoke-interface {v11, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    const/4 v5, 0x0

    goto/16 :goto_1
.end method
