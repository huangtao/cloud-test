.class Lcom/boyaa/engine/made/AppActivity$2;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppActivity;->onLowMemory()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppActivity;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppActivity;)V
    .locals 0

    .prologue
    .line 108
    iput-object p1, p0, Lcom/boyaa/engine/made/AppActivity$2;->this$0:Lcom/boyaa/engine/made/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 112
    invoke-static {}, Lcom/boyaa/engine/made/GhostLib;->onLowMemory()V

    .line 113
    return-void
.end method
