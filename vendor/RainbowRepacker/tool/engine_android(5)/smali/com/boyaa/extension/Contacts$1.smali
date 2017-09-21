.class Lcom/boyaa/extension/Contacts$1;
.super Ljava/lang/Object;
.source "Contacts.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/extension/Contacts;->callLua(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/extension/Contacts;

.field private final synthetic val$strContactsInfo:Ljava/lang/String;

.field private final synthetic val$strFuncName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/extension/Contacts;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/extension/Contacts$1;->this$0:Lcom/boyaa/extension/Contacts;

    iput-object p2, p0, Lcom/boyaa/extension/Contacts$1;->val$strContactsInfo:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/extension/Contacts$1;->val$strFuncName:Ljava/lang/String;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 53
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 54
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "contract_list"

    iget-object v4, p0, Lcom/boyaa/extension/Contacts$1;->val$strContactsInfo:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    new-instance v0, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v0, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 56
    .local v0, "jsonUtil":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v0}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    .line 57
    .local v2, "result":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    iget-object v4, p0, Lcom/boyaa/extension/Contacts$1;->val$strFuncName:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    return-void
.end method
