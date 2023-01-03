# upload-artifact-demo1

## Challenge
Artifacts in from GitHub Actions have log retention is set to the default of 90 days although people writing workflows may have chosen specific time periods. If you are creating large 

## Solution
To reduce the artifacts and logs storage it is probably best to:
- Set the default log retention policy for new Actions workflows as per docs at either the organization or enterprise level
- You can also define a custom retention period for individual artifacts using the actions/upload-artifact action in a workflow if you want to set less for a specific workflow which generates large artifacts. For more information, see [“Storing workflow data as artifacts.”](https://docs.github.com/en/actions/guides/storing-workflow-data-as-artifacts#configuring-a-custom-artifact-retention-period)
- Since previously executed Actions retention periods are unaffected you need to clean out any old data you want to remove earlier than the previous expiry - You can delete these through the GitHub UI for each workflow run as per the below image or use the API/CLI. This repo contains some [GitHub CLI command examples](https://github.com/DadsTaxi/upload-artifact-demo1/blob/main/list-artifacts.sh) which may help . 

## WARRANTY
USE AT OWN RISK

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
