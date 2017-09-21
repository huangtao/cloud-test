.class Lcom/boyaa/autotest/ElementProvider$3;
.super Ljava/lang/Object;
.source "ElementProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/autotest/ElementProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/autotest/ElementProvider;

.field private final synthetic val$selection:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/autotest/ElementProvider;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider$3;->this$0:Lcom/boyaa/autotest/ElementProvider;

    iput-object p2, p0, Lcom/boyaa/autotest/ElementProvider$3;->val$selection:Ljava/lang/String;

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/autotest/ElementProvider$3;)Lcom/boyaa/autotest/ElementProvider;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/boyaa/autotest/ElementProvider$3;->this$0:Lcom/boyaa/autotest/ElementProvider;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 125
    const-string v0, "getElements"

    iget-object v1, p0, Lcom/boyaa/autotest/ElementProvider$3;->val$selection:Ljava/lang/String;

    new-instance v2, Lcom/boyaa/autotest/ElementProvider$3$1;

    invoke-direct {v2, p0}, Lcom/boyaa/autotest/ElementProvider$3$1;-><init>(Lcom/boyaa/autotest/ElementProvider$3;)V

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    .line 143
    return-void
.end method
